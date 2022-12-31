@isTest
public class ParkLocatorTest {

     @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        // Call the method that invokes a callout
        String[] result = ParkLocator.country();
        // Verify that a fake result is returned
        System.debug('resultado web serice'+result); 
    }
    
}