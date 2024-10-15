public class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful 
{
    //use for trailhead Asynchronous Apex, module Use Batch Apex
	public String leadSource;
    // instance member to retain state across transactions
    public Integer recordsProcessed = 0;
        
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'Select id, LeadSource from lead'
        );
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
        system.debug('execute - scope:'+scope);
        // process each batch of records
        List<Lead> leadLst = new List<Lead>();
        for (Lead l : scope) {
            l.LeadSource = 'Dreamforce';
            leadLst.add(l);
        }
        update leadLst;
    }
    public void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
       // EmailUtils.sendMessage(job, recordsProcessed);
    }
}