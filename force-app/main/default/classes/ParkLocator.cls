// Apex Integration Services module - Apex SOAP Callout - Challenge Excercise
public class ParkLocator {
    public static String[] country (String country){
        String [] s;
        ParkService.ParksImplPort  calculator = new  ParkService.ParksImplPort ();
        
        s = calculator.byCountry(country);
        System.debug('parques:'+s);
        return s;
    }
}