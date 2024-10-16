//use for trailhead Asynchronous Apex, module Use Queueable Apex - Challenge execercise
@isTest
public class AddPrimaryContactTest {
    //
    @TestSetup
    static void makeData(){
        List<Account> accList = new     List<Account>();
        for(integer i=0; i<50; i++){
            Account a = new Account(name='Test'+i, billingState='NY');
            accList.add(a);
        }
        for(integer i=0; i<50; i++){
            Account a = new Account(name='Test'+i, billingState='CA');
            accList.add(a);
        }
        insert accList;
    }

    @isTest
    static void myUnitTest() {
        Contact con = new Contact(lastName='Test');
        AddPrimaryContact addPrymCont = new AddPrimaryContact(con, 'CA');
        Test.startTest();
        System.enqueueJob(addPrymCont);
        Test.stopTest();
        system.assertEquals(50, [Select count() from contact where account.billingState = 'CA']);
    }
}