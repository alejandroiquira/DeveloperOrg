@isTest
public class AccountProcessorTest {
    
    @isTest
    static void testCountContacts(){
        
        Account acc = new Account (Name = 'Test record', Number_Of_Contacts__c = 0);
        insert acc;
        
        system.debug('test 1 accId:'+acc.id);
        Contact c1 = new Contact (LastNAme = 'Contact1', accountId = acc.id);
        insert c1;
        Contact c2 = new Contact (LastNAme = 'Contact2', accountId = acc.id);
        insert c2;
        
        list<id> accList = new list<id>();
        accList.add(acc.id);
        
        Test.startTest();
        AccountProcessor.countContacts(accList);
        system.debug('test 2 acc.Number_Of_Contacts__c:'+acc.Number_Of_Contacts__c);
        Test.stopTest();
        Account acc2 = [select id, Number_Of_Contacts__c from Account where id = :acc.id];
        system.debug('test 3 acc2.Number_Of_Contacts__c:'+acc2.Number_Of_Contacts__c);
        
        Assert.AreEqual(acc2.Number_Of_Contacts__c,2,'Expected number 2 and it gets:'+acc.Number_Of_Contacts__c);
    }
    

}