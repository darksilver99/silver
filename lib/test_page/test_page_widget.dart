import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'test_page_model.dart';
export 'test_page_model.dart';

class TestPageWidget extends StatefulWidget {
  const TestPageWidget({
    Key? key,
    required this.testParam,
  }) : super(key: key);

  final String? testParam;

  @override
  _TestPageWidgetState createState() => _TestPageWidgetState();
}

class _TestPageWidgetState extends State<TestPageWidget> {
  late TestPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestPageModel());
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
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                dateTimeFormat(
                  'yMMMd',
                  getCurrentTimestamp,
                  locale: FFLocalizations.of(context).languageCode,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  color: Color(0xFFD5E0FC),
                  shape: BoxShape.circle,
                ),
              ),
              Icon(
                Icons.settings_outlined,
                color: FlutterFlowTheme.of(context).secondaryText,
                size: 24.0,
              ),
              Text(
                formatNumber(
                  random_data.randomInteger(0, 10),
                  formatType: FormatType.decimal,
                  decimalType: DecimalType.automatic,
                ),
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(
                    color: Color(0xFFD5E0FC),
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 2.0, 8.0, 2.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.insert_drive_file,
                        color: FlutterFlowTheme.of(context).tertiary,
                        size: 20.0,
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Hello World',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.0,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
