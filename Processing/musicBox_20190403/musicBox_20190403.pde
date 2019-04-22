//Jonathan Chan
//3-4-2019
//Music box

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;
musicBox x;
int[][] sheet;
float tempo = 240;

void setup() {
  size(500, 500);
  sheet = sheet3;
  x = new musicBox(sheet, tempo);
  minim = new Minim(this);

  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();
}

void draw() {
  x.mobiusLoop();
}
