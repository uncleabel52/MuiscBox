
let osc;
let sheet;
let x;
let tempo = 240;

function setup() {
  createCanvas(500, 500);
  sheet = sheet3;
  x = new musicBox(sheet, tempo);

  osc = new p5.TriOsc();

  osc.start();
  osc.amp(0);
}

function draw() {
  x.mobiusLoop();
}
