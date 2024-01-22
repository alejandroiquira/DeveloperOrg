import { LightningElement, api, wire } from 'lwc';
import ACCOUNT_NAME from '@salesforce/schema/Order.AccountId';
import ORDER_NAME from '@salesforce/schema/order.Name';
import ORDER_NUMBER from '@salesforce/schema/order.OrderNumber';
import getAccountOrders from '@salesforce/apex/accountOrderListController.getAccountOrders';

const COLUMNS = [
    {label : 'Account name', fieldName: ACCOUNT_NAME.fieldApiName, type: 'text'},
    {label: 'Order name', fieldName: ORDER_NAME.fieldApiName, type: 'text'},
    {label: 'Order Number', fieldName: ORDER_NUMBER.fieldApiName, fieldType: 'number'}
];
export default class AccountOrderList extends LightningElement {

    @api recordId;
    columns = COLUMNS;
    @wire(getAccountOrders, {accountId: '$recordId'})
    orders;
    
}