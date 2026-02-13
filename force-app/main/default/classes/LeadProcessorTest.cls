@isTest
private class LeadProcessorTest {
    @testSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();        // insert 10 accounts
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(lastName=i+'', Company='test company'+i, LeadSource=''));
        }
        system.debug('Leads:'+leads);
        insert leads;
        system.debug('Leads inserted:'+leads);
    }
    @isTest static void test() {
        Test.startTest();
        LeadProcessor uca = new LeadProcessor();
        Id batchId = Database.executeBatch(uca);
        Test.stopTest();
    }
}