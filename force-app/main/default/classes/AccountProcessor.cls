// Trailhead Asynchronous apex: future calls
public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(list<Id> accIds){
        list<Account> accsList = new list<Account>();
        for(Account acc : [select id, name, Number_Of_Contacts__c, (select id from contacts) from Account Where id in :accIds]){
            Account a = acc;
            system.debug('AccountProcessor countContacts size:'+acc.contacts.size());
            a.Number_Of_Contacts__c = (acc.contacts.size() > 0) ? acc.contacts.size() : 0;
            accsList.add(a);
        }

        update accsList;
    }
}