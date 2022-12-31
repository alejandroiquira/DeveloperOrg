import { LightningElement,api } from 'lwc';

export default class Selector extends LightningElement {
    selectedProductId;
    
    @api recordId;

    handleProductSelected(evt) {
        this.selectedProductId = evt.detail;
    }
}