import { LightningElement, wire } from 'lwc';
import FIRST_NAME from '@salesforce/schema/Contact.FirstName';
import LAST_NAME from '@salesforce/schema/Contact.LastName';
import CONTACT_EMAIL from '@salesforce/schema/Contact.Email';
import getContacts from '@salesforce/apex/ContactController.getContacts';
const COLUMNS  = [
    { label: 'First Name', fieldName: FIRST_NAME.fieldApiName, type: 'text' },
    { label: 'Last Name', fieldName: LAST_NAME.fieldApiName, type: 'text' },
    { label: 'Email', fieldName: CONTACT_EMAIL.fieldApiName, type: 'email' }
];

export default class ContactList extends LightningElement {
    colums=COLUMNS; 
    @wire(getContacts)
    contacts;
}