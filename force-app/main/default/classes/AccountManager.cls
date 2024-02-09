@RestResource(urlMapping='/Account/*/contacts')
global with sharing class AccountManager {

    @HttpGet
    global static Account getAccount() {
        system.debug(' AccountManager getAccount');
        RestRequest req =  RestContext.request;
        String accountId = req.requestURI.substringBetween('/Account/', '/contacts');
        system.debug(' AccountManager getAccount accountId:'+accountId);

        Account acc = [Select id, name, (select id, name from contacts) FROM Account where id = :accountId ];

        return acc;
    }

    @HttpPatch
    global static id upsertAccount(String name){
        system.debug(' AccountManager upsertAccount');
        Account acc = new Account (name = name);
        upsert acc;
        system.debug(' AccountManager upsertAccount 2');
        return acc.id;

    }
}