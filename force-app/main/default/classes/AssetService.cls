@RestResource(urlMapping='/lost/*')
global with sharing class AssetService {
    
    @HTTPPut
    global static String reportLostDevice(string assetIdentifier) {

        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        List<Asset> device =[SELECT Id, Asset_Identifier__c, Status FROM asset where Asset_Identifier__c=:assetIdentifier];
        system.debug('device:'+device);
       
        if (device.IsEmpty()){
            return 'No device found.';
        }

        List<Insurance__c> insurance = [SELECT Id,Coverage__c ,Name,Active__c FROM Insurance__c
                                            WHERE Coverage__c = 'Comprehensive'and Active__c = true and Asset__c = :device[0].id limit 1];
        system.debug('insurance:'+insurance);
        if (!insurance.IsEmpty()) {   
            
            List<Claim__c> claims = [SELECT Id, name, Status__c FROM Claim__c WHERE Asset__c = :device[0].id];
            system.debug('claims:'+claims);
            
            if (!claims.IsEmpty()) {
                system.debug('claims empty');
                return claims[0].name+' already filed.';
            } else {
                system.debug('device:'+device[0].Status);
                device[0].Status = 'Lost';
                update device;
                system.debug('device updated:'+device[0].Status);
                Claim__c claim = new Claim__c( Asset__c = device[0].Id, Status__c = 'New', Type__c = 'Loss');
                insert claim;
                
                claim = [select name from claim__c where id = :claim.id limit 1];
                system.debug('Claim inserted:'+claim);
                return claim.name;
            }
            
        } else {
            device[0].Status = 'Lost';
            system.debug('nocoverage:');
            update device;
            return 'No coverage. Asset status adjusted to Lost.';
        }
    }
}