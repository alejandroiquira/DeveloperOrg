import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import CONTACT_OBJECT from '@salesforce/schema/Contact';
import FIRSTNAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LASTTNAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';


export default class ContactCreator extends LightningElement {
    contactobject = CONTACT_OBJECT;
    fields = [FIRSTNAME_FIELD, LASTTNAME_FIELD, EMAIL_FIELD];

    handlesuccess(event){
        const toast = new ShowToastEvent (
            { title : "contact",
              message :  event.target.id,
              variant : "success"
            }
        );
        this.dispatchEvent(toast);
    }

}