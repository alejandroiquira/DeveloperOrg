// Trailhead Asynchronous apex: future calls
public with sharing class AccountProcessor {
    
    @future
    public static void countContacts(list<Id> accIds){
        list<Account> accsList = new list<Account>();
        map<Id,Account> accsMap = new map<Id, Account>([select id, name, Number_Of_Contacts__c from Account Where id in :accIds]);
        map<Object,Object> conXAcc = new map<Object,Object>();

        for (AggregateResult cA : [select count(id) numCont, accountId from Contact Where accountId in :accIds group by accountId]){
            conXAcc.put(cA.get('accountId'), cA.get('numCont'));
        }

        for(Account acc : accsMap.values()){
            Account a = acc;
            a.Number_Of_Contacts__c = conXAcc.containsKey(a.Id)? (Integer)conXAcc.get(a.Id) : 0;
            accsList.add(a);
        }

        update accsList;
    }
}