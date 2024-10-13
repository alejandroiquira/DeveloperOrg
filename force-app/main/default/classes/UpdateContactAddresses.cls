public class UpdateContactAddresses implements Database.Batchable<sObject>, Database.stateful{
    public Integer contactsUpdated = 0;
    
    public Database.QueryLocator Start(Database.BatchableContext bc) {
        Database.QueryLocator contacts = Database.getQueryLocator('Select id,  Account.Billingcity, Account.BillingCountry, MailingStreet'+
        ' from contact where Account.BillingCountry = \'USA\'');
        System.debug('scope amount: '+contacts);
        return contacts;
    }


    public void  execute (Database.BatchableContext bc, List<Contact> scope){
        List<Contact> contactsToUpdate = new List<Contact>();
        for(Contact c: scope){
            c.MailingStreet = c.Account.Billingcity;
            contactsToUpdate.add(c);
        }
        update contactsToUpdate;
        contactsUpdated += scope.size();
    }

    public void finish (Database.BatchableContext bc){
        System.debug('Contacts Updated: '+contactsUpdated);
        AsyncApexJob aj = [SELECT NumberOfErrors, JobItemsProcessed, TotalJobItems 
                            FROM AsyncApexJob 
                            WHERE Id=:bc.getJobId()];
                            // call some utility to send email
        //EmailUtils.sendMessage(job, recordsProcessed);
        
        System.debug('AsyncApexJob: '+aj);
    }
}