import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:silver/auth/firebase_auth/auth_util.dart';
import 'package:silver/backend/schema/users_record.dart';
import 'package:silver/flutter_flow/flutter_flow_util.dart';

class AgoraService {
  createCallRoom(UsersRecord receiveUser) {
    var data = {
      "caller_ref": currentUserReference,
      "receive_ref": receiveUser.reference,
      "create_date": getCurrentTimestamp,
      "is_end": false,
    };
    FirebaseFirestore.instance.collection("call_room_list").doc().set(data);
  }

  listenCalling() {
    FirebaseFirestore.instance.collection("call_room_list").where("receive_ref", isEqualTo: currentUserReference).where('is_end', isEqualTo: false).snapshots().listen((event) {
      print("listenCalling");
      print(event.docs.length);
      if (event.docs.length != 0) {
        updateReceive(event.docs[0].data()!["caller_ref"]);
      }
    });
  }

  updateReceive(callerRef) async {
    print("updateReceive");
    print(callerRef.path);
    var rsUser = await FirebaseFirestore.instance.doc(callerRef.path).get();
    FFAppState().update(() {
      FFAppState().isCallComing = true;
      FFAppState().callerUserRef = rsUser.reference;
    });
  }
}
