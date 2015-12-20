static String camelCaseToSpaces(String name)
{
  String output = "";
  for(int i = 0; i < name.length(); ++i)
  {
    char c = name.charAt(i);
    if(Character.isUpperCase(c))
    {
      output += " ";
    }
    output += Character.toLowerCase(c);
  }
  return output;
}