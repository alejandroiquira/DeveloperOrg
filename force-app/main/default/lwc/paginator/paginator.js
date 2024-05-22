import { LightningElement, api } from 'lwc';

export default class paginator extends LightningElement {
    @api isfirstpage;
    @api islastpage;
    @api currentpage = 1;
    handlePrevious(){
        console.debug('handlePrevious child component');
        this.dispatchEvent(new CustomEvent('previouspage'));
    }
    
    handleNext(){
        this.dispatchEvent(new CustomEvent('nextpage'));
        //this.dispatchEvent(new CustomEvent('subtract'));
    }
}