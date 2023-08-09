import '/backend/backend.dart';
import '/components/loading_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test2_page_model.dart';
export 'test2_page_model.dart';

class Test2PageWidget extends StatefulWidget {
  const Test2PageWidget({Key? key}) : super(key: key);

  @override
  _Test2PageWidgetState createState() => _Test2PageWidgetState();
}

class _Test2PageWidgetState extends State<Test2PageWidget> {
  late Test2PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Test2PageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 3000));
      setState(() {
        _model.isLoading = false;
      });
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
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
              'Test2Page',
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
                    StreamBuilder<List<ProvinceListRecord>>(
                      stream: queryProvinceListRecord(),
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
                        List<ProvinceListRecord>
                            listViewProvinceListRecordList = snapshot.data!;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: listViewProvinceListRecordList.length,
                          itemBuilder: (context, listViewIndex) {
                            final listViewProvinceListRecord =
                                listViewProvinceListRecordList[listViewIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 8.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Text(
                                  listViewProvinceListRecord.name,
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                if (_model.isLoading)
                  wrapWithModel(
                    model: _model.loadingViewModel,
                    updateCallback: () => setState(() {}),
                    child: LoadingViewWidget(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
