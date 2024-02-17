import { LightningElement, wire } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';

export default class contactDetailSelector extends LightningElement {

    selectedContact = [];
    @wire(getContacts)
    contacts;

    handleOnselectedContact(event){
        console.log('handleOnselectedContact:'+event.detail.Name);
        console.dir(this.contacts);
        this.selectedContact = event.detail;
    }
}