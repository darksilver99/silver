import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/broadcast/broadcast_from_view/broadcast_from_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'broadcast_list_model.dart';
export 'broadcast_list_model.dart';

class BroadcastListWidget extends StatefulWidget {
  const BroadcastListWidget({super.key});

  @override
  State<BroadcastListWidget> createState() => _BroadcastListWidgetState();
}

class _BroadcastListWidgetState extends State<BroadcastListWidget> {
  late BroadcastListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BroadcastListModel());
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

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              enableDrag: false,
              context: context,
              builder: (context) {
                return WebViewAware(
                  child: GestureDetector(
                    onTap: () => _model.unfocusNode.canRequestFocus
                        ? FocusScope.of(context)
                            .requestFocus(_model.unfocusNode)
                        : FocusScope.of(context).unfocus(),
                    child: Padding(
                      padding: MediaQuery.viewInsetsOf(context),
                      child: BroadcastFromViewWidget(),
                    ),
                  ),
                );
              },
            ).then((value) => safeSetState(() {}));
          },
          backgroundColor: FlutterFlowTheme.of(context).primary,
          elevation: 8.0,
          child: Icon(
            Icons.add_outlined,
            color: FlutterFlowTheme.of(context).alternate,
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
            'Broadcast List',
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
          child: StreamBuilder<List<BroadcastListRecord>>(
            stream: queryBroadcastListRecord(
              queryBuilder: (broadcastListRecord) =>
                  broadcastListRecord.orderBy('create_date', descending: true),
            ),
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
              List<BroadcastListRecord> listViewBroadcastListRecordList =
                  snapshot.data!;
              return ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                itemCount: listViewBroadcastListRecordList.length,
                itemBuilder: (context, listViewIndex) {
                  final listViewBroadcastListRecord =
                      listViewBroadcastListRecordList[listViewIndex];
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (listViewBroadcastListRecord.isLive) {
                          context.pushNamed(
                            'BroadcastDetail',
                            queryParameters: {
                              'url': serializeParam(
                                listViewBroadcastListRecord.url,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        } else {
                          _model.apiResultk31 = await GetLiveStreamIdCall.call(
                            playbackId: functions.getPlaybackIdFromUrl(
                                listViewBroadcastListRecord.url),
                          );
                          if ((_model.apiResultk31?.succeeded ?? true)) {
                            _model.apiResultaaf =
                                await GetPastLiveStreamCall.call(
                              streamId: GetLiveStreamIdCall.streamId(
                                (_model.apiResultk31?.jsonBody ?? ''),
                              ),
                            );
                            if ((_model.apiResultaaf?.succeeded ?? true)) {
                              context.pushNamed(
                                'BroadcastDetail',
                                queryParameters: {
                                  'url': serializeParam(
                                    functions.createUrlFromPlaybackId(
                                        GetPastLiveStreamCall.playbackId(
                                      (_model.apiResultaaf?.jsonBody ?? ''),
                                    )!),
                                    ParamType.String,
                                  ),
                                }.withoutNulls,
                              );
                            }
                          }
                        }

                        setState(() {});
                      },
                      child: Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        elevation: 4.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  listViewBroadcastListRecord.name,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              if (listViewBroadcastListRecord.isLive)
                                Icon(
                                  Icons.live_tv_rounded,
                                  color: FlutterFlowTheme.of(context).alternate,
                                  size: 24.0,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
