import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'calling_waitng_page_widget.dart' show CallingWaitngPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CallingWaitngPageModel extends FlutterFlowModel<CallingWaitngPageWidget> {
  ///  Local state fields for this page.

  String callerName = '-';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in CallingWaitngPage widget.
  UsersRecord? rsUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
