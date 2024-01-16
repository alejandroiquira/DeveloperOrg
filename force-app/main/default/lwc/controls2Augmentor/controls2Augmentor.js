import { LightningElement } from 'lwc';

export default class Controls2Augmentor extends LightningElement {
    
    startValue = 0;
    handleOnChange(event){
        this.startValue = parseInt(event.target.value);
    }
    
    //Parten to Child communication using updating child public property
    startCounter = 0;
    handleStartChange(event) {
      this.startCounter = parseInt(event.target.value);
    }

    //Parten to Child communication calling a public function in the child
    handleMaxCounter() {
        this.template.querySelector('c-controls2-Parent-Numerator').maximizeCounter();
    }
}