trigger ContactTrigger on Contact (before insert, before update) {

    /*
    list<String> countryList = new list<string>();
    for (contact c: trigger.new){
        countryList.add(c.MailingCountry);         
    }
    
    List<Continent__c> continentList = [Select Id, name, country from continent__C where name in(countryList)];
    Map<String, String> countryContinent = new map <String, String>();
    
    for (continent__c c :continentList){
        
        countryContinent.put(c.country, c.Name )
   
    }
     
    for (contact c: trigger.new){
        
       c.ContinentPiclList=  countryContinent.get(c.MailingCountry);

	        
    }
    
    */
    
    
    
    
    
}