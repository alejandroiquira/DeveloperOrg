public class AccountProcessor {

    @future
    public static void countContacts(List<id> accountIds){
        /*AggregateResult contactsXAccount = [select count(id) contacts, accountId 
                                                from contact
												where accountId in :accountIds
                                                group by accountId];
*/
        system.debug('accountIds:'+accountIds);
  		map<id, Account> accounts =  new map<id, Account> ([select id, Number_Of_Contacts__c from account where id in :accountIds]);
        list<Account> accountsToUpdate =  new list<Account>();
        system.debug('accounts:'+accounts);
        
        for(AggregateResult c : [select count(id) contactsNumber, accountId 
                                 from contact
                                 where accountId in :accountIds
                                 group by accountId]){
			id accountId = (id) c.get('accountId');
            Account ac = accounts.get(accountId);
			ac.Number_Of_Contacts__c =  (integer) c.get('contactsNumber');
			accountsToUpdate.add(ac);
		}
        system.debug('countContacts:'+accountsToUpdate.get(0));
        
        update accountsToUpdate;
    }
}