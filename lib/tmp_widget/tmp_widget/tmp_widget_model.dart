import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tmp_widget_widget.dart' show TmpWidgetWidget;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TmpWidgetModel extends FlutterFlowModel<TmpWidgetWidget> {
  ///  Local state fields for this page.

  List<String> testList = [];
  void addToTestList(String item) => testList.add(item);
  void removeFromTestList(String item) => testList.remove(item);
  void removeAtIndexFromTestList(int index) => testList.removeAt(index);
  void insertAtIndexInTestList(int index, String item) =>
      testList.insert(index, item);
  void updateTestListAtIndex(int index, Function(String) updateFn) =>
      testList[index] = updateFn(testList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
