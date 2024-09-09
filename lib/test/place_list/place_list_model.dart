import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'place_list_widget.dart' show PlaceListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class PlaceListModel extends FlutterFlowModel<PlaceListWidget> {
  ///  Local state fields for this page.

  List<dynamic> placeList = [];
  void addToPlaceList(dynamic item) => placeList.add(item);
  void removeFromPlaceList(dynamic item) => placeList.remove(item);
  void removeAtIndexFromPlaceList(int index) => placeList.removeAt(index);
  void insertAtIndexInPlaceList(int index, dynamic item) =>
      placeList.insert(index, item);
  void updatePlaceListAtIndex(int index, Function(dynamic) updateFn) =>
      placeList[index] = updateFn(placeList[index]);

  bool isLoading = true;

  bool isFullList = true;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PlaceList widget.
  List<PlaceListRecord>? fullListResultCopy;
  // Stores action output result for [Custom Action - sortListByLocation] action in PlaceList widget.
  List<dynamic>? resultList2Copy;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Algolia Search Results from action on Icon
  List<PlaceListRecord>? algoliaSearchResults = [];
  // Stores action output result for [Custom Action - sortListByLocation] action in Icon widget.
  List<dynamic>? resultList;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<PlaceListRecord>? fullListResult;
  // Stores action output result for [Custom Action - sortListByLocation] action in Icon widget.
  List<dynamic>? resultList2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
