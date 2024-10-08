public class AccountProcessor {

    @InvocableMethod(label='Account Processor count contacts')
    public static list<decimal> countContacts(List<id> accountIds){

        system.debug('accountIds:'+accountIds);
  		map<id, Account> accounts =  new map<id, Account> ([select id, Number_Of_Contacts__c from account where id in :accountIds]);
        list<Account> accountsToUpdate =  new list<Account>();
        list<decimal> numberOfContacts = new list<decimal>();
        system.debug('accounts:'+accounts);
        
        for(AggregateResult c : [select count(id) contactsNumber, accountId 
                                 from contact
                                 where accountId in :accountIds
                                 group by accountId]){
			id accountId = (id) c.get('accountId');
            Account ac = accounts.get(accountId);
			ac.Number_Of_Contacts__c =  (integer) c.get('contactsNumber');
			numberOfContacts.add(ac.Number_Of_Contacts__c);
			accountsToUpdate.add(ac);
		}
        system.debug('numberOfContacts:'+numberOfContacts);
        
        update accountsToUpdate;
        
        return numberOfContacts;
    }
                                 
    //@future
    public static void countContactsAsync(List<id> accountIds){
        countContacts(accountIds);
    }



  /*  public class inputvariables{
        @InvocableVariable 
        public List<Id> accountIds;
        public List<Id> contactsIds;
        
    }

    public class outputvariables{
        @InvocableVariable
        public List<Id> accountsUpdated;
    }
*/
}