@RestResource(urlMapping='/ProductZoning/*')
global with sharing class ProductZoningService {
    
    @HttpGet
    global static string ProductZoningService() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        
        // get custom header  
        String countryCode = req.headers.get('CountryCode');
        System.debug('CountryCode: '+countryCode);
        if  (String.IsBlank(countryCode)){
            countryCode = 'US';  
        }  
  
        //get input parameter  
        //String productCode = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        String productCode = req.params.get('ProductCode');
        System.debug('requestURI: '+ req.requestURI);
        System.debug('productCode: '+productCode);
        if (String.isEmpty(productCode)){
            System.debug('Enter if ');
            return 'ProductCode is missing or doesn\'t exist';
        }
        
        Product2[] prod = [Select id, family from product2 where productCode = :productCode];
        System.debug('Product record: '+prod);
        if (prod.size() < 1 ){
            return 'ProductCode is missing or doesn\'t exist';
        }

        System.debug('Family: '+prod[0].family);
        //String ProductName = req.params.get('name');


        System.debug('2 CountryCode: '+countryCode);

        Product_Geo_Mapping__mdt[] maping = [
            SELECT Permissible_Fly_Zone__c
            FROM Product_Geo_Mapping__mdt
            where Product_Family__c = :prod[0].family
            and Country_Code__c = :countryCode
        ];


        if (maping .size() > 0){
            return maping[0].Permissible_Fly_Zone__c;
        }else{
            return 'Confirm with the local authorities';
        }

    }
}