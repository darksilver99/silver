// Automatic FlutterFlow imports
import 'package:firebase_core/firebase_core.dart';

import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';

Future gbPrimePayment(
  BuildContext context,
  String? type,
) async {
  // Add your function code here!
  await FirebaseFirestore.instance.collection('payment_list').doc().set({
    'create_date': getCurrentTimestamp,
    'type': type,
  });
  if (type == "true") {
    var url = 'https://api.globalprimepay.com/v2/trueWallet';

    var publicKey = 'เอาจาก GB';
    var secretKey = 'เอาจาก GB';
    var referenceNo = '7129834671802641024';
    var responseUrl = 'https://www.google.com/1';
    var backgroundUrl = 'https://www.google.com/2';

    var customerName = 'customerName';
    var amount = 1.00;

    var detail = 'detail';
    var customerTelephone = '0997966384';

    var dataKey = '$amount$referenceNo$responseUrl$backgroundUrl';
    var checksum = calculateHmacSha256(secretKey, dataKey);

    print("checksum : $checksum");

    Map<String, String> header = {'Content-Type': 'application/x-www-form-urlencoded'};

    var requestBody = {
      "publicKey": publicKey,
      "secret_key": secretKey,
      'referenceNo': referenceNo,
      'responseUrl': responseUrl,
      'backgroundUrl': backgroundUrl,
      'amount': amount,
      'checksum': checksum,
      //'detail': detail,
      //'customerName': customerName,
      //'customerTelephone': customerTelephone
    };
    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: header);
    //print(response.body);
    FFAppState().htmlContent = response.body;
  }
}

String calculateHmacSha256(String key, String data) {
  final hmacSha256 = Hmac(sha256, utf8.encode(key)); // Create a HMAC-SHA256 hasher with the provided key
  final digest = hmacSha256.convert(utf8.encode(data)); // Compute the HMAC-SHA256 hash
  return base64Encode(digest.bytes); // Convert the hash to base64-encoded string
}
