public with sharing class accountOrderListController {

    //public static list<order> getAccountOrders(Id accountId){
    
    @AuraEnabled(cacheable=true)
    public static list<order> getAccountOrders(Id accountId){
        system.System.debug('accountOrderListController getAccountOrders accountId:'+accountId);

        return [select id, AccountId, Name, OrderNumber
                from order
                where AccountId= :accountid
                ];
    }
}