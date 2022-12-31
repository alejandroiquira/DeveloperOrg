import { LightningElement, api } from 'lwc';

export default class Augmentor extends LightningElement {

    @api recordId;
    @api objectApiName;
    @api flexipageRegionWidth;
    startCounter = 0;
    handleStartChange(event) {
      console.log("augmentor Startcounter 1:"+this.startcounter);
      this.startCounter = parseInt(event.target.value);
      console.log("augmentor event.target.value 2 int:"+parseInt(event.target.value));
      console.log("augmentor event.target 3:"+event.target);
      console.log("augmentor event 4:"+event);
    }

    handleMaximizeCounter() {
        this.template.querySelector('c-numerator').maximizeCounter(4);
      }

}