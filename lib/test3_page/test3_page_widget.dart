import '/backend/backend.dart';
import '/components/list_switch_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test3_page_model.dart';
export 'test3_page_model.dart';

class Test3PageWidget extends StatefulWidget {
  const Test3PageWidget({Key? key}) : super(key: key);

  @override
  _Test3PageWidgetState createState() => _Test3PageWidgetState();
}

class _Test3PageWidgetState extends State<Test3PageWidget> {
  late Test3PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Test3PageModel());
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
          'Test3Page',
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
                          return ListSwitchViewWidget(
                            key: Key(
                                'Key9h0_${listViewIndex}_of_${listViewDataListRecordList.length}'),
                            parameter1: listViewDataListRecord.name,
                            parameter2: listViewDataListRecord.isCheck,
                            parameter3: listViewDataListRecord.reference,
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
