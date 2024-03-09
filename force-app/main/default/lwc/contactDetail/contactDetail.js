import { LightningElement, api } from 'lwc';

export default class ContactDetail extends LightningElement {
    // Public attribute will be asigned from parent
    @api contact;

    // Public function will be invoked in communication parent-child
    @api
    addLastNameSufix(contact){
        contact.LastName = contact.LastName + ' -SUFIX';
        this.contact = contact;
    }

    //communication child-parent sending data with a custom event
    handleOnClick(event){
        this.dispatchEvent(new CustomEvent("selectedcontact", {detail : this.contact}
        ));
    }
}