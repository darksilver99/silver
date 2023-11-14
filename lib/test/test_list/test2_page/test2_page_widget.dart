import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/test/compo/list_switch_view/list_switch_view_widget.dart';
import '/test/compo/loading_view/loading_view_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
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
      _model.dataListResult = await queryDataListRecordOnce();
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
          'Test2LoadBefore',
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
                  child: Builder(
                    builder: (context) {
                      final dataList = _model.dataListResult?.toList() ?? [];
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: dataList.length,
                        itemBuilder: (context, dataListIndex) {
                          final dataListItem = dataList[dataListIndex];
                          return wrapWithModel(
                            model: _model.listSwitchViewModels.getModel(
                              dataListIndex.toString(),
                              dataListIndex,
                            ),
                            updateCallback: () => setState(() {}),
                            child: ListSwitchViewWidget(
                              key: Key(
                                'Keyhbe_${dataListIndex.toString()}',
                              ),
                              parameter1: dataListItem.name,
                              parameter2: dataListItem.isCheck,
                              parameter3: dataListItem.reference,
                            ),
                          );
                        },
                      );
                    },
                  ),
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
    );
  }
}
