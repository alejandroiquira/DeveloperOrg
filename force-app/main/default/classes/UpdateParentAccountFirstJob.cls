//use for trailhead Asynchronous Apex, module Use Queueable Apex - example of chaining Queueable jobs
public class UpdateParentAccountFirstJob implements Queueable {

    public void execute(QueueableContext qC) {
        List<Account> acLst = new List<Account>();
        Id parentId = [select id from account][0].Id;
        System.enqueueJob(new UpdateParentAccount(acLst, parentId));
    }
}