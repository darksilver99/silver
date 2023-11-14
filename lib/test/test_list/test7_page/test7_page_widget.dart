import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test7_page_model.dart';
export 'test7_page_model.dart';

class Test7PageWidget extends StatefulWidget {
  const Test7PageWidget({Key? key}) : super(key: key);

  @override
  _Test7PageWidgetState createState() => _Test7PageWidgetState();
}

class _Test7PageWidgetState extends State<Test7PageWidget> {
  late Test7PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Test7PageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_model.checkedRefList.length > 0) {
            await actions.delListData(
              _model.checkedRefList.toList(),
            );
            _model.checkedRefList = [];
          }
        },
        backgroundColor: FlutterFlowTheme.of(context).primary,
        elevation: 8.0,
        child: Icon(
          Icons.delete,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 24.0,
        ),
      ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          borderWidth: 1.0,
          buttonSize: 60.0,
          icon: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primary,
            size: 30.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Test7Stream del data checked',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Kanit',
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 3.0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<DataListRecord>>(
                    stream: queryDataListRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: SpinKitChasingDots(
                              color: FlutterFlowTheme.of(context).tertiary,
                              size: 50.0,
                            ),
                          ),
                        );
                      }
                      List<DataListRecord> listViewDataListRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewDataListRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewDataListRecord =
                              listViewDataListRecordList[listViewIndex];
                          return Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 8.0, 0.0, 0.0),
                            child: Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  visualDensity: VisualDensity.compact,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                ),
                                unselectedWidgetColor:
                                    FlutterFlowTheme.of(context).secondaryText,
                              ),
                              child: CheckboxListTile(
                                value: _model.checkboxListTileValueMap[
                                    listViewDataListRecord] ??= false,
                                onChanged: (newValue) async {
                                  setState(() =>
                                      _model.checkboxListTileValueMap[
                                          listViewDataListRecord] = newValue!);
                                  if (newValue!) {
                                    _model.addToCheckedRefList(
                                        listViewDataListRecord.reference);
                                  } else {
                                    _model.removeFromCheckedRefList(
                                        listViewDataListRecord.reference);
                                  }
                                },
                                title: Text(
                                  listViewDataListRecord.name,
                                  style:
                                      FlutterFlowTheme.of(context).titleLarge,
                                ),
                                subtitle: Text(
                                  listViewDataListRecord.detail,
                                  style:
                                      FlutterFlowTheme.of(context).labelMedium,
                                ),
                                tileColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                activeColor:
                                    FlutterFlowTheme.of(context).primary,
                                checkColor: FlutterFlowTheme.of(context).info,
                                dense: false,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
