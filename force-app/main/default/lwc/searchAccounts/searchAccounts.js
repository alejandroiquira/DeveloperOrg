import { LightningElement, api, wire } from 'lwc';
import contactList from '@salesforce/apex/findContacts.findContacts';
const COLUMS = [
    {
        label: 'Name',
        fieldName: 'Name'
    },
    {
        label: 'Title',
        fieldName: 'Title'
    },
    {
        label: 'Phone',
        fieldName: 'Phone'
    }
];
export default class SearchAccounts extends LightningElement {

    cols = COLUMS;
    @api keyword = '';
    @wire(contactList,{searchKey: '$keyword'})
    contacts;


    handleChange (event){
        this.keyword = event.target.value;
    }

}