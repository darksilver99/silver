import 'package:silver/test/custom/BlockData.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageCustom1Widget extends StatefulWidget {
  const HomePageCustom1Widget({Key? key}) : super(key: key);

  @override
  _HomePageCustom1WidgetState createState() => _HomePageCustom1WidgetState();
}

class _HomePageCustom1WidgetState extends State<HomePageCustom1Widget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<BlockData> blocks = [];

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
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
      //onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      for (var i = 0; i < blocks.length; i++) {
                        print(">>>>>>>>>$i");
                        print(blocks[i].textFieldValue);
                        print(blocks[i].checkboxValue);
                      }
                      return;
                      context.pushNamed('TestPage');
                    },
                    text: 'testPage',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() {
                        blocks.add(BlockData()); // เพิ่ม block ใหม่
                      });
                    },
                    text: 'add block',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: blocks.length,
                  itemBuilder: (context, index) {
                    return BlockWidget(
                      data: blocks[index],
                      onDelete: () {
                        print("before");
                        print(blocks);
                        setState(() {
                          blocks.removeAt(index);
                        });
                        print("after");
                        print(blocks);
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
