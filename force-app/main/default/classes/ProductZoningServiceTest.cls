@isTest
private class ProductZoningServiceTest {

    @TestSetup
    static void makeData(){
        Product2 product = new Product2(Name = 'Test Product', ProductCode = '1234567890', IsActive = true, Family = 'family');
        insert product;
        
    }

    @isTest
    static void myUnitTest() {
        RestRequest req = new RestRequest();
        req.requestURI = '/services/apexrest/ProductZoningService/';
        req.addParameter( 'ProductCode','1234567890');
        req.HTTPMethod = 'GET';
        req.headers.put('CountryCode', 'US');

        RestContext.request = req;
        RestContext.response = new RestResponse();

        String res = ProductZoningService.ProductZoningService();
        Assert.areEqual('Confirm with the local authorities', res);

        // Empty CountryCode
        req.headers.put('CountryCode', '');
        res = ProductZoningService.ProductZoningService();
        Assert.areEqual('Confirm with the local authorities', res);

        // Empty product code
        req = new RestRequest();
        req.requestURI = '/services/apexrest/ProductZoningService/';
        req.HTTPMethod = 'GET';
        req.headers.put('CountryCode', 'US');
        RestContext.request = req;
        res = ProductZoningService.ProductZoningService();
        Assert.areEqual('ProductCode is missing or doesn\'t exist', res);

        //Invalid rpduct code
        
        req = new RestRequest();
        req.requestURI = '/services/apexrest/ProductZoningService/';
        req.addParameter( 'ProductCode','zzzyyy');
        req.HTTPMethod = 'GET';
        req.headers.put('CountryCode', 'US');
        RestContext.request = req;
        res = ProductZoningService.ProductZoningService();
        Assert.areEqual('ProductCode is missing or doesn\'t exist', res);
        

    }
}