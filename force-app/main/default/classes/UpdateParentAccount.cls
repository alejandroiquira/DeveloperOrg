public  class UpdateParentAccount implements System.Queueable{
    
    //use for trailhead Asynchronous Apex, module Use Queueable Apex
    private List<Account> accounts;
    private Id parentID;
    
    public UpdateParentAccount(list<Account> accLst, Id parentAcc ) {
        this.accounts = accLst;
        this.parentId = parentAcc;

    }

    public void execute(QueueableContext context){
        for (Account ac : accounts){
            ac.parentId = this.parentId;
        }
        //perform other processing or callout
        update accounts;
    }
}

/* //1. example of how to add this class as a job in the queue
// find all accounts in ‘NY’
List<Account> accounts = [select id from account where billingstate = ‘NY’];
// find a specific parent account for all records
Id parentId = [select id from account where name = 'ACME Corp'][0].Id;
// instantiate a new instance of the Queueable class
UpdateParentAccount updateJob = new UpdateParentAccount(accounts, parentId);
// enqueue the job for processing
ID jobID = System.enqueueJob(updateJob);

/// 2. To monitor progress programmatically by querying AsyncApexJob:
//SELECT Id, Status, NumberOfErrors FROM AsyncApexJob WHERE Id = :jobID

*/