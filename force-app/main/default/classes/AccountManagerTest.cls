/**
 * Rest web service example
 */
@isTest
public class AccountManagerTest {

    @isTest
    public static void getAccountTest() {
        
        Id accId = createAccount(); 
        // Set up a test request
        system.debug('AccountManagerTest 1');
        Contact cont = new Contact (lastName = 'TestContact', accountid = accId);
        insert cont;
        system.debug('AccountManagerTest 2 cont:'+cont);
        RestRequest rq = new RestRequest();
        rq.requestURI = 'https://brave-shark-aopfgn-dev-ed.lightning.force.com/services/apexrest/Accounts/' + accId + '/contacts';
        rq.httpMethod = 'GET';
        //rq.requestParams.put(status, 'Active');
        rq.requestBody = Blob.valueOf('{"name":"TestAccount","phone":"123456"}');
        RestContext.request = rq;
        Account acc = AccountManager.getAccount();
        Assert.isTrue(acc != null);
        Assert.areEqual(acc.Name, 'Test record');
    }

    public static id createAccount(){
        Account acc = new Account (Name = 'Test record');
        insert acc;
        system.debug('AccountManagerTest createAccount:'+acc);
        return acc.id;
    }
}