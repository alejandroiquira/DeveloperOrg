//use for trailhead Asynchronous Apex, module Use Queueable Apex - Challenge execercise
public class AddPrimaryContact implements Queueable{
    private Contact con;
    private String state;
    private List<Contact> conLst; 
    public AddPrimaryContact(Contact con, String state) {
        this.con = con;
        this.state = state;
        conLst = new List<Contact>();
    }

    public void execute(QueueableContext context){
        
        for (Account acc :[Select id from Account where billingstate = :this.state limit 200]){
            Contact c = con.clone();
            c.AccountId = acc.id;
            conLst.add(c);
        }
        insert conLst;
    }
}