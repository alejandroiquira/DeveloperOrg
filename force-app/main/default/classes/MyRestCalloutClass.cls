public with sharing class MyRestCalloutClass {

    @AuraEnabled
    public static String invokeRestWithoutAuth() {
        // JSONPlaceholder API URL for testing
        String apiUrl = 'https://jsonplaceholder.typicode.com/todos/1';

        HttpRequest request = new HttpRequest();
        request.setEndpoint(apiUrl);
        request.setMethod('GET');

        HttpResponse response = new Http().send(request);

        if (response.getStatusCode() == 200) {
            return response.getBody();
        } else {
            throw new CalloutException('Failed to make the REST callout. Status code: ' + response.getStatusCode());
        }
    }

    @AuraEnabled
    public static String invokeApiWithAuthentication() {
        // Replace these values with your GitHub username and a personal access token
        String username = 'alejandroiquira';
        String accessToken = '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';
        String endpoint = 'https://api.github.com/users/' + username;

        HttpRequest request = new HttpRequest();
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        request.setHeader('Content-Type', 'application/json');
        request.setHeader('Authorization', 'Bearer ' + accessToken);

        HttpResponse response = new Http().send(request);

        if (response.getStatusCode() == 200) {
            // Successful response
            String responseBody = response.getBody();
            System.debug('Response from GitHub API: ' + responseBody);
            // You can handle the response data as needed
        } else {
            // Error handling
            System.debug('Error invoking GitHub API. Status code: ' + response.getStatusCode());
            System.debug('Response body: ' + response.getBody());
        }
        return response.getBody();
    }
}