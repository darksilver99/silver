import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/test/list_switch_view/list_switch_view_widget.dart';
import '/test/loading_view/loading_view_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Test2PageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Test2Page widget.
  List<DataListRecord>? dataListResult;
  // Models for listSwitchView dynamic component.
  late FlutterFlowDynamicModels<ListSwitchViewModel> listSwitchViewModels;
  // Model for loadingView component.
  late LoadingViewModel loadingViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    listSwitchViewModels =
        FlutterFlowDynamicModels(() => ListSwitchViewModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  void dispose() {
    listSwitchViewModels.dispose();
    loadingViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}