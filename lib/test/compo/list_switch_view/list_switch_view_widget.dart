import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'list_switch_view_model.dart';
export 'list_switch_view_model.dart';

class ListSwitchViewWidget extends StatefulWidget {
  const ListSwitchViewWidget({
    super.key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  });

  final String? parameter1;
  final bool? parameter2;
  final DocumentReference? parameter3;

  @override
  State<ListSwitchViewWidget> createState() => _ListSwitchViewWidgetState();
}

class _ListSwitchViewWidgetState extends State<ListSwitchViewWidget> {
  late ListSwitchViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListSwitchViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: Material(
        color: Colors.transparent,
        child: SwitchListTile.adaptive(
          value: _model.switchListTileValue ??= widget!.parameter2!,
          onChanged: (newValue) async {
            safeSetState(() => _model.switchListTileValue = newValue!);
            if (newValue!) {
              await widget!.parameter3!.update(createDataListRecordData(
                isCheck: true,
              ));
            } else {
              await widget!.parameter3!.update(createDataListRecordData(
                isCheck: false,
              ));
            }
          },
          title: Text(
            widget!.parameter1!,
            style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
                ),
          ),
          subtitle: Text(
            'Subtitle goes here...',
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Montserrat',
                  letterSpacing: 0.0,
                ),
          ),
          tileColor: FlutterFlowTheme.of(context).secondaryBackground,
          activeColor: FlutterFlowTheme.of(context).primary,
          activeTrackColor: FlutterFlowTheme.of(context).accent1,
          dense: false,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ),
    );
  }
}
