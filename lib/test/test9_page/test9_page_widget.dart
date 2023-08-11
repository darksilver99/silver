import '/backend/api_requests/api_calls.dart';
import '/components/toggle_test_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test9_page_model.dart';
export 'test9_page_model.dart';

class Test9PageWidget extends StatefulWidget {
  const Test9PageWidget({Key? key}) : super(key: key);

  @override
  _Test9PageWidgetState createState() => _Test9PageWidgetState();
}

class _Test9PageWidgetState extends State<Test9PageWidget> {
  late Test9PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Test9PageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
          'Test8Future api  list and delete item',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Kanit',
                color: FlutterFlowTheme.of(context).primary,
                fontSize: 12.0,
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
                  child: FutureBuilder<ApiCallResponse>(
                    future: DataListCall.call(),
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
                      final listViewDataListResponse = snapshot.data!;
                      return Builder(
                        builder: (context) {
                          final dataList = DataListCall.data(
                                listViewDataListResponse.jsonBody,
                              )?.toList() ??
                              [];
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: dataList.length,
                            itemBuilder: (context, dataListIndex) {
                              final dataListItem = dataList[dataListIndex];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: Slidable(
                                      endActionPane: ActionPane(
                                        motion: const ScrollMotion(),
                                        extentRatio: 0.25,
                                        children: [
                                          // ใช้ setstate หรือ refresh DB ก็ได้
                                          SlidableAction(
                                            label: 'del',
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            icon: Icons.delete,
                                            onPressed: (_) async {
                                              _model.apiResultcj9 =
                                                  await DataListDelCall.call(
                                                docID: getJsonField(
                                                  dataListItem,
                                                  r'''$.id''',
                                                ).toString(),
                                              );
                                              if ((_model.apiResultcj9
                                                      ?.succeeded ??
                                                  true)) {
                                                setState(() {});
                                              }

                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          getJsonField(
                                            dataListItem,
                                            r'''$.name''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .titleLarge,
                                        ),
                                        subtitle: Text(
                                          getJsonField(
                                            dataListItem,
                                            r'''$.detail''',
                                          ).toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium,
                                        ),
                                        tileColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        dense: false,
                                      ),
                                    ),
                                  ),
                                  ToggleTestWidget(
                                    key: Key(
                                        'Keyksw_${dataListIndex}_of_${dataList.length}'),
                                    isCheck: getJsonField(
                                      dataListItem,
                                      r'''$.is_check''',
                                    ),
                                    docID: getJsonField(
                                      dataListItem,
                                      r'''$.id''',
                                    ).toString(),
                                  ),
                                ],
                              );
                            },
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
