@isTest
global class ParkServiceMock implements WebServiceMock  {
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
        // start - specify the response you want to send
        parksServices.byCountryResponse  response_x = 
            new parksServices.byCountryResponse ();
        response_x.return_x[0]='Park1';
        response_x.return_x[1]='Park2';
        // end
        response.put('response_x', response_x); 
   }
}