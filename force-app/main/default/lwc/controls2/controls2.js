import { LightningElement } from 'lwc';

export default class Controls2 extends LightningElement {

    factors = [1,2,3,4,5,6];
    handleSubstract(){
        this.dispatchEvent(new CustomEvent('substract'))
    }

    handleAdd(){
        this.dispatchEvent(new CustomEvent('add'))
    }

    handleMultiply(event){
        const factor = event.target.dataset.factor;
        let message = "myultiply by:" + factor;
        console.log('Controls2 handleMultiply:'+ message);
        this.dispatchEvent(new CustomEvent('multiply',{
            detail: {
              factorvalue  : factor, messagesent : message
            }
        }));
    }
    
    handleMultiply2(event){
        console.log('Controls2 handleMultiply2');
        const factor = event.target.dataset.factor;
        let message = "myultiply using:" + factor;
        console.log('Controls2 factor 1:'+message);
        this.dispatchEvent(new CustomEvent('multiply', {
            detail : { 
                factorvalue : factor, messagesent : message
            }
        }));
    }

}