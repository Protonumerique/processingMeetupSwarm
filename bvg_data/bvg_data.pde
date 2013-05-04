
ArrayList<PVector> stops;

PVector min, max, range;

void setup() {
  fill(255);
  size(900, 900);
  BvgParser bvgParser = new BvgParser();

  stops = bvgParser.parse();
  print(stops.size());
  
  min = bvgParser.MinPositions(stops);
  max = bvgParser.MaxPositions(stops);
  
  range = PVector.sub(max, min);
  noStroke();


}

void draw() {
  background(0);
  
  for( PVector s : stops ) {
    float x = (s.x - min.x)/range.x;
    float y = (s.y - min.y)/range.y;
    ellipse( x * width , y * height , 2, 2 );
  }
}
