import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/test/compo/blank_view/blank_view_widget.dart';
import '/test/compo/toggle_test/toggle_test_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Test9PageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Models for toggleTest dynamic component.
  late FlutterFlowDynamicModels<ToggleTestModel> toggleTestModels;
  // Stores action output result for [Backend Call - API (dataListDel)] action in SlidableActionWidget widget.
  ApiCallResponse? apiResultcj9;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    toggleTestModels = FlutterFlowDynamicModels(() => ToggleTestModel());
  }

  void dispose() {
    toggleTestModels.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
