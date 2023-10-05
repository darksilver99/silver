import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'test7_page_widget.dart' show Test7PageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Test7PageModel extends FlutterFlowModel<Test7PageWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> checkedRefList = [];
  void addToCheckedRefList(DocumentReference item) => checkedRefList.add(item);
  void removeFromCheckedRefList(DocumentReference item) =>
      checkedRefList.remove(item);
  void removeAtIndexFromCheckedRefList(int index) =>
      checkedRefList.removeAt(index);
  void insertAtIndexInCheckedRefList(int index, DocumentReference item) =>
      checkedRefList.insert(index, item);
  void updateCheckedRefListAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      checkedRefList[index] = updateFn(checkedRefList[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for CheckboxListTile widget.

  Map<DataListRecord, bool> checkboxListTileValueMap = {};
  List<DataListRecord> get checkboxListTileCheckedItems =>
      checkboxListTileValueMap.entries
          .where((e) => e.value)
          .map((e) => e.key)
          .toList();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
