

class musicBox {

  constructor(sheet, tempo) {
    this.sheet = sheet;
    this.tempo = 1000/tempo*60;
    this.prevTime = 0;
    this.read = 0;
    this.turn = true;
    this.notes = [349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.25, 698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51];
  }
  loop() {
    if (millis() - this.prevTime >= this.tempo) {
      for (let i = 0; i<24; i++) {
        if (this.sheet[this.read][i] == 1) {
          playNote(this.notes[i], 0.7);
        }
      }
      this.read = (this.read+1) % this.sheet.length;
      this.prevTime = millis();
    }
  }

  mobiusLoop() {
    if (millis() - this.prevTime >= this.tempo) {
      let turnVal = 0;

      if (this.read == 0)   this.turn = !this.turn;

      if (this.turn == false) turnVal = 0;
      if (this.turn) turnVal = 23;

      for (let i = 0; i < 24; i++) {
        if (this.sheet[this.read][abs(i-turnVal)] == 1) {
          playNote(this.notes[i], 700);
        }
      }
      this.read = (this.read+1) % this.sheet.length;
      this.prevTime = millis();
    }
  }

}


function playNote(note, duration) {
  osc.freq(note);
  osc.fade(0.5, 0.2);

  if (duration) {
    setTimeout(osc.fade(0, 0.2), duration - 50);
  }

}
