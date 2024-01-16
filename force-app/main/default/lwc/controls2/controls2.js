import { LightningElement } from 'lwc';

export default class Controls2 extends LightningElement {

    factors = [1,2,3,4,5,6];
    handleSubstract(){
        this.dispatchEvent(new CustomEvent('substract'))
    }

    handleAdd(){
        this.dispatchEvent(new CustomEvent('add'))
    }

    //Simple custom event Child parent communication
    handleMultiply(event) {
        const factor = event.target.dataset.factor;
        this.dispatchEvent(new CustomEvent('multiply', {
          detail: factor
        }));
      }
    
    handleMultiplyBubble(event){
        console.log('Controls2 handleMultiplyBubble');
        const factor = event.target.dataset.factor;
        let message = "myultiply bubble event:" + factor;
        console.log('Controls2 message 1:'+message);
        this.dispatchEvent(new CustomEvent('multiplybubbles', {
            detail : { 
                factorvalue : factor, messagesent : message
            }
        }));
    }

}