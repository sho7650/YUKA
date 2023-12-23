import { LightningElement } from 'lwc';

export default class Yuka extends LightningElement {
  tate = 0;
  yoko = 0;
  handleTateChange(event) {
    this.tate = event.target.value;
  }

  handleYokoChange(event) {
    this.yoko = event.target.value;
  }

  handleClick() {
    alert(this.tate * this.yoko);
  }
}