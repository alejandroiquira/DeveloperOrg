import { LightningElement, wire, track, api } from 'lwc';
import getContacts from '@salesforce/apex/ContactController.getContacts';

export default class contactDetailSelector extends LightningElement {

    selectedContact = [];
    @api contacts2 = [];
    
    // Contacts will filled using an imperative call
    contacts;
    @wire(getContacts)
    getContactListcontacts(result){
        console.log('getContactListcontacts 1 result-'+result.data);
            
        if (result.data) {
            console.log('getContactListcontacts: Data received');
            //comunicaction parent child asigning a property in the child
            this.contacts = result.data;
            // As contacts was asigned imperatively, to asign contact2 using contacts is not necessary to use this.contacts.data;
            this.contacts2 = this.contacts;
        } else if (result.error) {
            console.error('getContactListcontacts error:', result.error);
        }
    };

    // comunicaction parent child asigning a property in the child
    handleOnselectedContact(event){
        console.log('handleOnselectedContact:'+event.detail.Name);
        console.dir(this.contacts);
        this.selectedContact = event.detail;
        
        /*/ Finding the record using the id. In that case the key={contact.id} in the template
            const contactId = event.detail;
            this.selectedContact = this.contacts.data.find((contact) => contact.Id === contactId);
        */
    }

    // communication parent-child invoking public function in the child
    modifyContactList(){
        console.log('handleOnselectedContact:'+typeof this.contacts2);
        // Get all instances of the child component
        const contactDetailComponents = this.template.querySelectorAll('c-contact-detail');

        // Iterate over each instance and invoke the public method
        contactDetailComponents.forEach(contactDetail => {
            const contact = contactDetail.contact;
            contactDetail.addLastNameSufix(contactDetail.contact);
        });
    }
}