trigger Account_trg on Account (before insert, before update) {

    
    list<account> accList = Trigger.new;
    
    
    
    for (Account a:accList ){
        
        
    	accList.get(0).phone = '666666666';
        system.debug('la variable accList tiene:'+accList);
    }
    
    
    
    
    
    
    
}