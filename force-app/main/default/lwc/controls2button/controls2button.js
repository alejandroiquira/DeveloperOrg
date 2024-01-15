import { LightningElement, api } from 'lwc';

export default class Controls2button extends LightningElement {

    @api label;
    @api icon;
    handleButton(event){
        this.dispatchEvent(new CustomEvent ('multiplybutton',{
            bubbles : true
        }));
    }
    
}