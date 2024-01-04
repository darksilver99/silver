import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/broadcast/broadcast_from_view/broadcast_from_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'broadcast_list_widget.dart' show BroadcastListWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BroadcastListModel extends FlutterFlowModel<BroadcastListWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Backend Call - API (getLiveStreamId)] action in Card widget.
  ApiCallResponse? apiResultk31;
  // Stores action output result for [Backend Call - API (getPastLiveStream)] action in Card widget.
  ApiCallResponse? apiResultaaf;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
