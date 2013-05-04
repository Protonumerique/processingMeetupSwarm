class BvgParser {
  private String[] _rawData;
  public BvgParser() {
  }
  
  private float getCoordFromString( String s ) {
    return float( s.replaceAll("^\"|\"$", "") );
  }

  public ArrayList<PVector> parse() {
    ArrayList<PVector> stops =  new ArrayList<PVector>();
    _rawData = loadStrings("stops.txt");
    for ( int i=1; i<_rawData.length; ++i) {
      String[] line = split(_rawData[i], "," );
      float x = getCoordFromString( line[4] );
      float y = getCoordFromString( line[5] );
      
      if( x != Float.NaN && y != Float.NaN ) {
        stops.add( new PVector(getCoordFromString(line[4]), getCoordFromString(line[5]) ) );
      }
    }
    return stops;
  }
}

