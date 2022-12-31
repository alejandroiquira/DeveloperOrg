public class AnimalLocator {

    
    public static String getAnimalNameById(integer id){
     	String s;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+id);
        request.setMethod('GET');	
        
                
        HttpResponse response = http.send(request);
        system.debug('response:'+response.getBody());
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            // Deserializes the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            
            object objAnimal = results.get('animal');
            system.debug('mapa animals objAnimal:'+objAnimal);
            
            Map<String, Object> animalAttributes = (Map<String, Object>)objAnimal;
            system.debug('mapa animalAttributes:'+animalAttributes);

            s= (String)animalAttributes.get('name');
            system.debug('retornar s:'+s);
        }
        return s;
    }
    
     
    
}