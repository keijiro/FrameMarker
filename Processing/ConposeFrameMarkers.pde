void setup()
{
  for (int i = 0; i < 32; i++)
  {
    PImage source = loadImage(String.format("frameMarker_%03d.png", i));
    PImage image = createImage(64, 64, ARGB);
    
    for (int y = 0; y < 64; y++)
    {
      for (int x = 0; x < 64; x++)
      {
        if (x < 3 || y < 3 || x >= 61 || y >= 61) continue;
        
        if ((x == 3 || x == 60) && (y == 3 || y == 60)) continue;
        
        if ((x == 16 || x == 47) && (y == 16 || y == 47))
        {
          image.set(x, y, color(255));
          continue;
        }
        
        if (x >= 16 && y >= 16 && x < 48 && y < 48) continue;
        
        if (x >= 9 && y >= 9 && x < 55 && y < 55)
        {
          color c = source.get(x - 9, y - 9);
          c = color(brightness(c));
          image.set(x, y, c);
        }
        else
        {
          image.set(x, y, color(255));
        }
      }
    }
    
    image.save(String.format("Marker%03d.png", i));
  }
}

