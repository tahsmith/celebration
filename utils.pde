static boolean isUpper(char c)
{
  Character cCopy = new Character(c);
  return cCopy < 'a';
}

static char toLower(char c)
{ 
  Character cCopy = new Character(c);
  if(isUpper(c))
  {
    return (new Character((char)((int)cCopy + 32))).toString().charAt(0);
  }
  else
  {
    return c;
  }
}

static String camelCaseToSpaces(String name)
{
  
  String output = "";
  for(int i = 0; i < name.length(); ++i)
  {
    char c = name.charAt(i);
    if(isUpper(c))
    {
      output += " " + toLower(c);
    }
    else
    {
      output += c;
    }
  }
  return output;
}

PVector randomDir3d()
{
  PVector x = new PVector(random(-1, 1), random(-1, 1), random(-1, 1));
  x.normalize();
  return x;
}