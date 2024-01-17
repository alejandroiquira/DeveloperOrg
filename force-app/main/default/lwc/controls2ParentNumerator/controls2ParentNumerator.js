import { LightningElement, api } from 'lwc';

export default class Controls2ParentNumerator extends LightningElement {
    @api counter = 0;
    _currentCount = 0;
    priorCount = 0;
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
        this.counter2 = this.counter;
        console.log('Controls2ParentNumerator 2');
        this.othermessage = event.detail.messagesent;
        console.log('Controls2ParentNumerator 3 message:'+this.othermessage);
      }

      
    handleMultiply(event) {
        this.counter2 = this.counter;
        const factor = event.detail;
        this.othermessage = 'Multiply using single CustomEvent';
        this.counter *= factor;
    }

    @api
        maximizeCounter(){
        console.log('maximizeCounter this.counter:'+this.counter);
        this.counter =+ 1000000;
    };

    @api
    get counter2(){
        this._currentCount = this.counter;
        return this._currentCount;
    }
    set counter2(value){
        this.priorCount = this._currentCount;
        this._currentCount = value;
    }

}