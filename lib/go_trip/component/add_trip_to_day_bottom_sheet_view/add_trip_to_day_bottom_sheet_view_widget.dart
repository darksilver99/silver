import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'add_trip_to_day_bottom_sheet_view_model.dart';
export 'add_trip_to_day_bottom_sheet_view_model.dart';

class AddTripToDayBottomSheetViewWidget extends StatefulWidget {
  const AddTripToDayBottomSheetViewWidget({super.key});

  @override
  State<AddTripToDayBottomSheetViewWidget> createState() =>
      _AddTripToDayBottomSheetViewWidgetState();
}

class _AddTripToDayBottomSheetViewWidgetState
    extends State<AddTripToDayBottomSheetViewWidget> {
  late AddTripToDayBottomSheetViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddTripToDayBottomSheetViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Builder(
        builder: (context) {
          final testLIst = FFAppState().monthList.toList();
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: List.generate(testLIst.length, (testLIstIndex) {
                final testLIstItem = testLIst[testLIstIndex];
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              color: FlutterFlowTheme.of(context).accent2,
                              size: 36.0,
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 4.0, 0.0, 0.0),
                              child: Container(
                                width: 18.0,
                                height: 18.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Text(
                                  '0',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Montserrat',
                                        fontSize: 10.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            'Day 1 (15  Aug)',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).addToEnd(SizedBox(height: 16.0)),
            ),
          );
        },
      ),
    );
  }
}
