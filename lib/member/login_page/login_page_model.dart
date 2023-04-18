import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // State field(s) for displayName widget.
  TextEditingController? displayNameController;
  String? Function(BuildContext, String?)? displayNameControllerValidator;
  // State field(s) for phone widget.
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for emailSignUp widget.
  TextEditingController? emailSignUpController;
  String? Function(BuildContext, String?)? emailSignUpControllerValidator;
  // State field(s) for passwordSignUp widget.
  TextEditingController? passwordSignUpController;
  late bool passwordSignUpVisibility;
  String? Function(BuildContext, String?)? passwordSignUpControllerValidator;
  // State field(s) for comfirmPassword widget.
  TextEditingController? comfirmPasswordController;
  late bool comfirmPasswordVisibility;
  String? Function(BuildContext, String?)? comfirmPasswordControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    passwordVisibility = false;
    passwordSignUpVisibility = false;
    comfirmPasswordVisibility = false;
  }

  void dispose() {
    emailController?.dispose();
    passwordController?.dispose();
    displayNameController?.dispose();
    phoneController?.dispose();
    emailSignUpController?.dispose();
    passwordSignUpController?.dispose();
    comfirmPasswordController?.dispose();
  }

  /// Additional helper methods are added here.

}
