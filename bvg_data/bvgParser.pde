import java.util.*;
class BvgParser {
  
  public PVector berlinCoord;
  
  private float threshold = 0.1f;
  
  private String[] _rawData;
  
  public BvgParser() {
    berlinCoord = new PVector(52.519171f, 13.4060912f); 
  }

  private float getCoordFromString( String s ) {
    return float( s.replaceAll("^\"|\"$", "") );
  }
  
  private boolean inBerlinX( float x )
  {
    return x != Float.NaN && Math.abs(berlinCoord.x - x) < threshold;
  }
  
  private boolean inBerlinY( float y )
  {
    return y != Float.NaN && Math.abs(berlinCoord.y - y) < threshold;
  }

  public ArrayList<PVector> parse() {
    ArrayList<PVector> stops =  new ArrayList<PVector>();
    _rawData = loadStrings("stops.txt");
    for ( int i=1; i<_rawData.length; ++i) {
      String[] line = split(_rawData[i], "," );
      float x = getCoordFromString( line[4] );
      float y = getCoordFromString( line[5] );
      if ( inBerlinX(x) && inBerlinY(y) ) {
        stops.add( new PVector(getCoordFromString(line[4]), getCoordFromString(line[5]) ) );
      }
    }    
    return stops;
  }

  public PVector MinPositions(ArrayList<PVector> stops) {

    float mi_x = Float.MAX_VALUE;
    float mi_y = Float.MAX_VALUE;
    PVector minXY = new PVector();
    for (Iterator<PVector> i = stops.iterator(); i.hasNext();) {

      PVector v = (PVector)i.next();
      if (v.x < mi_x)mi_x=v.x;
      if (v.y < mi_y)mi_y=v.y;
      minXY.set(mi_x, mi_y, 0);
    }
    return minXY;
  }

  public PVector MaxPositions(ArrayList<PVector> stops) {

    float ma_x = -Float.MAX_VALUE;
    float ma_y = -Float.MAX_VALUE;
    PVector maxXY = new PVector();
    for (Iterator<PVector> i = stops.iterator(); i.hasNext();) {

      PVector v = (PVector)i.next();
      if (v.x > ma_x)ma_x=v.x;
      if (v.y > ma_y)ma_y=v.y;
      maxXY.set(ma_x, ma_y, 0);
    }
    return maxXY;
  }
}

