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

class ListSwitchViewCustomWidget extends StatefulWidget {
  const ListSwitchViewCustomWidget({
    Key? key,
    this.parameter1,
    this.parameter2,
    this.parameter3,
  }) : super(key: key);

  final String? parameter1;
  final bool? parameter2;
  final DocumentReference? parameter3;

  @override
  _ListSwitchViewCustomWidgetState createState() => _ListSwitchViewCustomWidgetState();
}

// with AutomaticKeepAliveClientMixin<ListSwitchViewCustomWidget>
// bool get wantKeepAlive => true;
// super.build(context);
// สำรหับ future ข้อมูล พวก switch checkbox ถ้าติ๊กแล้ว สกอลให้พ้นส่วนที่ติ๊กแล้ว กลับมาที่เดิม การติ๊กครั้งนั้นมันจะกลับไปเป็นเหมือนเดิม 3 บรรทัดบน แก้ส่วนนี้
class _ListSwitchViewCustomWidgetState extends State<ListSwitchViewCustomWidget> with AutomaticKeepAliveClientMixin<ListSwitchViewCustomWidget> {
  late ListSwitchViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  bool get wantKeepAlive => true;

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
    context.watch<FFAppState>();
    super.build(context);
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
      child: SwitchListTile.adaptive(
        value: _model.switchListTileValue ??= widget.parameter2!,
        onChanged: (newValue) async {
          setState(() => _model.switchListTileValue = newValue!);
          if (newValue!) {
            await widget.parameter3!.update(createDataListRecordData(
              isCheck: true,
            ));
          } else {
            await widget.parameter3!.update(createDataListRecordData(
              isCheck: false,
            ));
          }
        },
        title: Text(
          widget.parameter1!,
          style: FlutterFlowTheme.of(context).titleLarge,
        ),
        subtitle: Text(
          'Subtitle goes here...',
          style: FlutterFlowTheme.of(context).labelMedium,
        ),
        tileColor: FlutterFlowTheme.of(context).secondaryBackground,
        activeColor: FlutterFlowTheme.of(context).primary,
        activeTrackColor: FlutterFlowTheme.of(context).accent1,
        dense: false,
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }
}
