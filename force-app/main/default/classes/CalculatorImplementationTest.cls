// Apex Integration Services module - Apex SOPA Callout
@isTest
public class CalculatorImplementationTest {
    @isTest
    public static void testCallout() {
        // This causes a fake response to be generated
        test.setMock(WebServiceMock.Class, new CalculatorImplementationCalloutMock());
        Double result = CalculatorImplementation.add(3,2);
        System.AssertEquals(30.0, result);
        result = CalculatorImplementation.multiply(3,2);
        System.AssertEquals(60, result);
    }
}