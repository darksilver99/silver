import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestWidgetModel extends FlutterFlowModel {
  ///  Local state fields for this page.

  List<LatLng> test = [];
  void addToTest(LatLng item) => test.add(item);
  void removeFromTest(LatLng item) => test.remove(item);
  void removeAtIndexFromTest(int index) => test.removeAt(index);
  void updateTestAtIndex(int index, Function(LatLng) updateFn) =>
      test[index] = updateFn(test[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
