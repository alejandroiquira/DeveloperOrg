// Apex Integration Services module - Apex SOPA Callout
@isTest
global class CalculatorImplementationCalloutMock implements WebServiceMock{
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType) {
            
            if (requestName == 'doAdd') {
                // Start - Mocking the response of doAdd web service method
                calculatorServices.doAddResponse addResponse = new calculatorServices.doAddResponse();
                addResponse.return_x = 30.0; // Simulating that the addition of x and y will return 30.0
                response.put('response_x', addResponse);
                // end
            } else if (requestName == 'doMultiply') {
                // Start -  Mocking the response of doMultiply web service method
                calculatorServices.doMultiplyResponse multiplyResponse = new calculatorServices.doMultiplyResponse();
                multiplyResponse.return_x = 60; // Simulating that multiplication 
                response.put('response_x', multiplyResponse);
                // end
            }
    }
}