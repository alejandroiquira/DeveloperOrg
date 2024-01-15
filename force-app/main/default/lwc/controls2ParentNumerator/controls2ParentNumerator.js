import { LightningElement, api } from 'lwc';

export default class Controls2ParentNumerator extends LightningElement {
    @api counter = 0;
    othermessage = '';
    handleIncrement(){
        this.counter++;
    }

    handleDecrement(){
        this.counter--;
    }

   handleMultiplyBubbles(event) {
        console.log('Controls2ParentNumerator 1');
        const factor = event.detail.factorvalue;
        this.counter *= factor;
        console.log('Controls2ParentNumerator 2');
        this.othermessage = event.detail.messagesent;
        console.log('Controls2ParentNumerator 3:'+this.othermessage);
      }

      
      handleMultiply(event) {
        const factor = event.detail;
        this.counter *= factor;
      }
}