trigger BatchApexErrorTrigger on BatchApexErrorEvent (after insert) {

    
	list<BatchLeadConvertErrors__c>   listBL=new list<BatchLeadConvertErrors__c> ();
    for(BatchApexErrorEvent ba: trigger.new){
system.debug('BatchApexErrorTrigger1:'+ba);
        BatchLeadConvertErrors__c   baTmp = new BatchLeadConvertErrors__c(AsyncApexJobId__c = ba.AsyncApexJobId,  Records__c  = ba.JobScope, StackTrace__c = ba.StackTrace);
        //BatchLeadConvertErrors__c   baTmp = new BatchLeadConvertErrors__c();
		listBL.add(baTmp);
system.debug('BatchApexErrorTrigger2:'+listBL);
    }
system.debug('BatchApexErrorTrigger3:');
    insert listBL;
system.debug('BatchApexErrorTrigger4:');
}