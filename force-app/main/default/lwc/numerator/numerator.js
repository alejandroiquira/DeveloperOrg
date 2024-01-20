import { LightningElement, api } from 'lwc';

export default class Numerator extends LightningElement {


   // @api counter = 0;
   _currentCount = 0;
   priorCount = 0;
   @api
   get counter() {
     return this._currentCount;
   }
   set counter(value) {
     this.priorCount = this._currentCount;
     this._currentCount = value;
   }

    handleIncrement() {
      this.counter++;
    }
    handleDecrement() {
      this.counter--;
    }
    handleMultiply(evt) {
      console.log("numerator 1");
      const factor = evt.detail;
      console.log("numerator 2 factor"+factor);
      this.counter*=factor;
    }
    @api
    maximizeCounter(x) {
      this.counter += 1000000;
      console.log("x:"+x);    
    }

}