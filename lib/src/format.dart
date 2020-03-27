/// output years as 4 digit
const String yyyy = "yyyy";

/// output years as 2 digit
const String yy = "yy";

/// output months as 2 digit
const String mm = "mm";

/// output days as 2 digit
const String dd = "dd";

// This Function gives length of the delimiter
// to be applied
List<int> getformat(List<String> formats) {
  List<int> _outputFormat = [];

  for (String format in formats) {
    if (format == yyyy || format == yy || format == dd || format == mm)
      _outputFormat.add(format.length);
    else
      print("Enter formats correctly");
  }

  return _outputFormat;
}
