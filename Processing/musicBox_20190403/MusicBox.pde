//Jonathan Chan
//3-4-2019
//Music box class


class musicBox {
  int[][] sheet;
  float tempo;
  float prevTime = 0;
  int read = 0;
  boolean turn = false;
  
  float[] notes = {349.23, 369.99, 392.00, 415.30, 440.00, 466.16, 493.88, 523.25, 554.37, 587.33, 622.25, 659.25, 
    698.46, 739.99, 783.99, 830.61, 880.00, 932.33, 987.77, 1046.50, 1108.73, 1174.66, 1244.51, 1318.51};
  
  
  
  musicBox(int[][] sheet_, float tempo_) {
    sheet = sheet_;
    tempo = 1000/tempo_*60;
  }

  void loop() {
    if (millis() - prevTime >= tempo) {
      for (int i = 0; i<24; i++) {
        if (sheet[read][i] == 1) {
          out.playNote(0.0, 0.7, notes[i]);
        }
      }
      read=(read+1)%sheet.length;
      prevTime = millis();
    }
  }
  
  void mobiusLoop() {
    if (millis() - prevTime >= tempo) {     
      int turnVal = 0;
      
      //Invert the boolean for inverting the score everytime the sheet completes a round of playing
      if (read == 0) {
        turn = !turn;
      }
      
      //Return turnVal by the turn boolean
      if (turn == false)  turnVal = 0;
      if (turn)  turnVal = 23;
    
      
      //Play the note
      for (int i = 0; i<24; i++) {
        
        //abs(i-turnVal) for a inverted value
        if (sheet[read][abs(i-turnVal)] == 1) {
          out.playNote(0.0, 0.7, notes[i]);
        }
      }
      
      //to loop the sheet
      read=(read+1)%sheet.length;
      
      //tempo control
      prevTime = millis();
    }
  }
}
