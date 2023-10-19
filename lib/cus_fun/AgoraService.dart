import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:silver/auth/firebase_auth/auth_util.dart';
import 'package:silver/backend/schema/users_record.dart';
import 'package:silver/flutter_flow/flutter_flow_util.dart';

typedef OnHangUpCallback = void Function(dynamic);

class AgoraService {
  createCallRoom(UsersRecord receiveUser, Function onCallback) async {
    print("createCallRoom");
    DocumentReference docRef = FirebaseFirestore.instance.collection('call_room_list').doc();
    await docRef.set({
      "caller_ref": currentUserReference,
      "receive_ref": receiveUser.reference,
      "create_date": getCurrentTimestamp,
      "is_end": false,
    });

    FFAppState().callRoomPath = docRef.path;
    listenWaiting(onCallback);
  }

  listenCalling() {
    FirebaseFirestore.instance.collection("call_room_list").where("receive_ref", isEqualTo: currentUserReference).where('is_end', isEqualTo: false).snapshots().listen((event) {
      print("listenCalling");
      if (event.docs.length != 0) {
        FFAppState().callRoomPath = event.docs[0].reference.path;
        if(!event.docs[0].data().containsKey("is_receiver_answer")){
          updateReceive(event.docs[0].data()!["caller_ref"]);
        }

      }
    });
  }

  updateReceive(callerRef) async {
    print("updateReceive");
    var rsUser = await FirebaseFirestore.instance.doc(callerRef.path).get();
    FFAppState().update(() {
      FFAppState().isCallComing = true;
      FFAppState().callerUserRef = rsUser.reference;
    });
    listenHangUp();
  }

  listenHangUp() {
    if (FFAppState().callRoomPath != "")
      FirebaseFirestore.instance.doc(FFAppState().callRoomPath).snapshots().listen((event) {
        print("listenHangUp");
        if (event.data()!["is_end"]) {
          print("listenHangUp 2");
          FFAppState().update(() {
            FFAppState().isCallComing = false;
            FFAppState().callerUserRef = null;
          });
        }
      });
  }

  listenWaiting(onCallback) {
    if (FFAppState().callRoomPath != "")
      FirebaseFirestore.instance.doc(FFAppState().callRoomPath).snapshots().listen((event) {
        print("listenWaiting");
        if (event.data()!.containsKey('is_receiver_answer')) {
          if (!event.data()!['is_receiver_answer']) {
            print("listenWaiting 2");
            onCallback();
          }
        }
      });
  }
}
