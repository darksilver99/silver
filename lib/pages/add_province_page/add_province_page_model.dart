import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProvincePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for name widget.
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for postCode widget.
  TextEditingController? postCodeController;
  String? Function(BuildContext, String?)? postCodeControllerValidator;
  // Stores action output result for [Backend Call - API (addProvince)] action in Button widget.
  ApiCallResponse? apiResult1z8;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    nameController?.dispose();
    postCodeController?.dispose();
  }

  /// Additional helper methods are added here.

}
