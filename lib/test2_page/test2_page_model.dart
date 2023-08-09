import '/components/loading_view_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Test2PageModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Model for loadingView component.
  late LoadingViewModel loadingViewModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    loadingViewModel = createModel(context, () => LoadingViewModel());
  }

  void dispose() {
    unfocusNode.dispose();
    loadingViewModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
