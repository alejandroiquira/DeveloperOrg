/**
 * Rest web service example
 */
@isTest
private class AccountManagerTest {

    @isTest
    static void myUnitTest() {
        
        Id accId = createAccount(); 
        // Set up a test request
        system.debug('test 1');
        Contact cont = new Contact (lastName = 'TestContact', accountid = accId);
        insert cont;
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://alejito-dev-ed.lightning.force.com/services/apexrest/Account/'
            + accId + '/contacts/';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        system.debug('test 2');
        Account thisCase = AccountManager.getAccount();
        system.debug('test 3');
        // Verify results
        System.assert(thisCase != null);
        //System.assertEquals('Test record', thisCase.Subject);
    }

    public static id createAccount(){
        Account acc = new Account (Name = 'Test record');
        insert acc;
        return acc.id;
    }
}