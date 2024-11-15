import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'test_widget_widget.dart' show TestWidgetWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TestWidgetModel extends FlutterFlowModel<TestWidgetWidget> {
  ///  Local state fields for this page.

  List<LatLng> test = [];
  void addToTest(LatLng item) => test.add(item);
  void removeFromTest(LatLng item) => test.remove(item);
  void removeAtIndexFromTest(int index) => test.removeAt(index);
  void insertAtIndexInTest(int index, LatLng item) => test.insert(index, item);
  void updateTestAtIndex(int index, Function(LatLng) updateFn) =>
      test[index] = updateFn(test[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
