import { LightningElement } from 'lwc';
export default class HelloWorld2 extends LightningElement {
  greeting = 'World';
  changeHandler(event) {
    this.greeting = event.target.value;
  }
}