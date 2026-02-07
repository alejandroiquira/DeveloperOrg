@isTest
public with sharing class AssetServiceTest {
    @TestSetup
    static void makeData(){
        Account acc = new Account(Name = 'Test Account');
        insert acc;

        Contact con = new contact (Lastname = 'Test Contact', AccountId = acc.Id);
        insert con;
        
        Asset device = new Asset(Name = 'Test device', AccountId = acc.Id, ContactId = con.id, Asset_Identifier__c = '1234567890');
        insert device;

        Insurance__c ins = new Insurance__c(Coverage__c = 'Comprehensive',Active__c = true, Asset__c = device.id);
        insert ins;       
    }

    @isTest
    static void myUnitTest() {
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/lost/';
        req.HTTPMethod = 'PUT';
        //req.addParameter( 'assetIdentifier','1234567890');;
        //req.params.put('assetIdentifier', '1234567890');
        req.requestBody = Blob.valueOf('{"assetIdentifier": "1234567890"}');
        RestContext.request = req;
        RestContext.response = new RestResponse();
        String result = AssetService.reportLostDevice('1234567890');
        
        // check when a claim already exist
        result = AssetService.reportLostDevice('1234567890');

        
        // check when the asset does not exist
        result = AssetService.reportLostDevice('2222');
    }


}