public class ParkLocator {

    public static String[] country (){
        String [] s;
        parksServices.ParksImplPort  calculator = new  parksServices.ParksImplPort ();
        
        s = calculator.byCountry('Germany');
        System.debug('parques:'+s);
        return s;
    }
}