import { LightningElement, api } from 'lwc';

export default class ContactDetail extends LightningElement {

    @api contact;

    handleOnClick(event){
        this.dispatchEvent(new CustomEvent("selectedcontact", {detail : this.contact}
        ));
    }
}