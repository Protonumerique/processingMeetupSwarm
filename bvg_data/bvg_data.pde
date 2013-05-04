void setup() {
  size(600, 400);
  BvgParser bvgParser = new BvgParser();
  ArrayList<PVector> stops = bvgParser.parse();
  print(stops);
}

void draw() {
  background(0);
}
