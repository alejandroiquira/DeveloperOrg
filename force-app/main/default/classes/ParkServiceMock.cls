// Apex Integration Services module - Apex SOAP Callout - Challenge Excercise
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
            System.debug('ParkServiceMock requestName:'+requestName);
            // start - specify the response you want to send
            ParkService.byCountryResponse  response_x = 
               new ParkService.byCountryResponse ();
            response_x.return_x=new String[]{'Park1','Park2'};
            //response_x.return_x[0]='Park1';
            //response_x.return_x[1]='Park2';
            // end
response.put('response_x', response_x); 
   }
}