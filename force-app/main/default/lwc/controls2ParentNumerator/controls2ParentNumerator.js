import { LightningElement } from 'lwc';

export default class Controls2ParentNumerator extends LightningElement {
    counter = 0;
    othermessage = '';
    handleIncrement(){
        this.counter++;
    }

    handleDecrement(){
        this.counter--;
    }

    handleMultiply(event) {
        console.log('Controls2ParentNumerator 1');
        const factor = event.detail.factorvalue;
        this.counter *= factor;
        console.log('Controls2ParentNumerator 2');
        this.othermessage = event.detail.messagesent;
        console.log('Controls2ParentNumerator 3:'+this.othermessage);
      }
}