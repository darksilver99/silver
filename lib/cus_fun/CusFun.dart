import 'dart:ui';

Color hexToColor(String hexString) {
  // Remove any leading # symbol or 0x prefix
  if (hexString.startsWith('#')) {
    hexString = hexString.substring(1);
  } else if (hexString.startsWith('0x')) {
    hexString = hexString.substring(2);
  }

  // Ensure that the hexadecimal string has exactly six characters
  if (hexString.length != 6) {
    //throw ArgumentError("Invalid hex color: $hexString");
    return Color(0xFF000000);
  }

  // Parse the hexadecimal string as an integer and add alpha (0xFF) to it
  int colorValue = int.parse(hexString, radix: 16) + 0xFF000000;

  // Return the Color object
  return Color(colorValue);
}

String testFun({String aaa = '', bbb}) {
  print('aaa : $aaa');
  if (aaa != '' && bbb != null) {
    return "ttt";
  }
  return "fff";
}

int divide(int a, int b) {
  if (b == 0) {
    throw Exception('Cannot divide by zero');
  }
  return a ~/ b;
}
