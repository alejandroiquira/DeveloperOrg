@restResource(urlMapping='/Accounts/*/contacts')
global class AccountManager{

    @HTTPGet
    global static Account getAccount(){
        RestRequest rq = RestContext.request;
        system.debug('AccounManager requestURI: '+rq.requestURI);
        String accID = rq.requestURI.subStringBetween('/Accounts/', '/contacts');
        system.debug('AccounManager accID: '+accID);
        Account ac = [select Id, Name, (select Id, Name from contacts) from account where id = :accId];
        system.debug('AccounManager ac: '+ac);
        return ac;
    }
}