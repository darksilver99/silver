import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

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

Future<String> uploadToAPI(Uint8List photoBytes) async {
  print("uploadToAPI");

  final url = Uri.parse("https://superapp.kd3.dev/api/upload_image");

  final request = http.MultipartRequest('POST', url);

  //for (int i = 0; i < photos.length; i++) {
  //final photoBytes = photos[i];
  final photoStream = http.ByteStream.fromBytes(photoBytes);
  final multipartFile = http.MultipartFile.fromBytes(
    'images[]', // Use 'images[]' to send multiple photos
    photoBytes,
    filename: 'photo.jpg',
    contentType: MediaType('image', 'jpeg'),
  );
  request.files.add(multipartFile);
  request.headers.addAll({
    "Os" : "Android",
    "App-Version" : "1.0",
    "Os-Version" : "3.0",
    "Lang" : "th",
    "Authorization" : "xx",
  });
  //}


  // Send request

  final streamedResponse = await request.send();

  print("aaa");

  // Read response
  final response = await http.Response.fromStream(streamedResponse);
  final responseBody = jsonDecode(response.body);

  print("bbb");

  // Close the client
  http.Client().close();
  try {
    print("ccc");
    print(responseBody);
    return responseBody["data"][0];
  } catch (e) {
    print("ddd");
    print(e);
    return "";
  }
}