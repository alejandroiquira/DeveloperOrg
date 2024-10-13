@isTest
private class UpdateContactAddressesTest {
    @TestSetup
    static void setUp(){
        List<Account> acLst = new List<Account>();
        List<Contact> cLst = new List<Contact>();
         
        for(Integer i=1; i<10; i++){
                Account ac = new Account(Name = 'Test Account '+i, BillingCity = 'New York', BillingCountry = 'USA', BillingStreet= 'Street '+i);
                acLst.add(ac);
        }

        insert acLst;

        for(Account a : acLst){
            contact c1 = new Contact(LastName = 'Contact 1-'+a.Name , AccountId = a.Id, MailingStreet = 'Empty');
            cLst.add(c1);
            contact c2 = new Contact(LastName = 'Contact 2-'+a.Name , AccountId = a.Id, MailingStreet = 'Empty');
            cLst.add(c2);
        }

        System.debug('Test acLst:'+acLst.size());
        System.debug('Test cLst:'+cLst.size());        
        insert cLst;
    }
    @isTest
    static void testBatchUpdateContactAddresses(){
        Test.startTest();
        UpdateContactAddresses uca = new UpdateContactAddresses();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();   
    }
}