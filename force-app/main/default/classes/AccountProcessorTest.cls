@isTest
private class AccountProcessorTest {

    @isTest
    static void myUnitTest() {
        
        Account newAcc = new Account(Name = 'Test Account');
        insert newAcc;

        Contact c1 = new Contact(LastName = 'Test Contact', AccountId = newAcc.Id);
        Contact c2 = new Contact(LastName = 'Test Contact', AccountId = newAcc.Id);
        insert new list<Contact>{c1,c2};

        test.startTest();
        AccountProcessor.countContacts(new list<Id>{newAcc.id});
        test.stopTest();

        decimal contCount = [Select Number_Of_Contacts__c from account where id = :newAcc.id].Number_Of_Contacts__c;

        System.assertEquals(2,contCount);
    }
}