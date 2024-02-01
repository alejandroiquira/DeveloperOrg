import { LightningElement, api } from 'lwc';
import invokeRestNoAuth from '@salesforce/apex/MyRestCalloutClass.invokeRestWithoutAuth';
import invokeRestWithAuth from '@salesforce/apex/MyRestCalloutClass.invokeApiWithAuthentication';
export default class MyRestCallOutComponent extends LightningElement
{   
    @api responseData;
    invokeRestFromLwcNoAuth(){
        /*const endpoint = 'https://jsonplaceholder.typicode.com/todos/1';

        // Make the HTTP request using the Fetch API
        fetch(endpoint)
            .then(response => response.json())
            .then(data => {
                this.responseData = data;
                console.log('invokeRestFromLwcNoAuth response:'+this.response);
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
        */
        
        const calloutURI = 'https://api.ipify.org?format=json';
        fetch(calloutURI, {
            method: "GET"
        }).then((response) => response.json())
            .then(repos => {
                console.log(repos);
                console.log(repos.ip);
        });
    }

    invokeRestFromLwcWithAuth() {
        // Replace these values with your GitHub username and a personal access token
        const username = 'alejandroiquira';
        const accessToken = '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';
        const endpoint = `https://api.github.com/users/${username}`;

        // Set up the HTTP request options
        const requestOptions = {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${accessToken}`
            }
        };

        // Make the HTTP request using the Fetch API
        fetch(endpoint, requestOptions)
            .then(response => response.json())
            .then(data => {
                console.log('Response from the GitHub API:', data);
                // You can handle the response data as needed
            })
            .catch(error => {
                console.error('Error invoking GitHub API:', error);
                // Handle errors appropriately
            });
    }

    invokeRestFromApexNoAuth (){
        invokeRestNoAuth()
        .then(result => {
            console.log('invokeRestFromApexNoAuth Result: '+result);
        })
        .catch(error =>{
            console.error('invokeRestFromApexNoAuth Error invoking GitHub API:', error);

        });

    }

    invokeRestFromApexWithAuth (){

        invokeRestWithAuth()
            .then(result => {
                console.log('invokeRestFromApexWithAuth:'+ result);
            })
            .catch(error => {
                console.error('invokeRestFromApexWithAuth Error invoking GitHub API:', error);
            });
        /*invokeRestWithAuth()
        .then(result => {
            console.log('invokeRestFromApexWithAuth Result: '+result);
        })
        .catch(error =>{

        });*/
    }
}