// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<ChatRoomListRecord?> getChatRoom(
  DocumentReference? user1,
  DocumentReference? user2,
) async {
  // Add your function code here!
  var rs1 = await FirebaseFirestore.instance
      .collection('chat_room_list')
      .where('create_by', isEqualTo: user1)
      .where('partner', isEqualTo: user2)
      .get();
  var rs2 = await FirebaseFirestore.instance
      .collection('chat_room_list')
      .where('create_by', isEqualTo: user2)
      .where('partner', isEqualTo: user1)
      .get();
  if (rs1.size != 0) {
    ChatRoomListRecord chatRoomListResult =
        await ChatRoomListRecord.getDocumentOnce(rs1.docs[0].reference);
    return chatRoomListResult;
  }
  if (rs2.size != 0) {
    ChatRoomListRecord chatRoomListResult =
        await ChatRoomListRecord.getDocumentOnce(rs2.docs[0].reference);
    return chatRoomListResult;
  }
  return null;
}
