import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'toggle_test_model.dart';
export 'toggle_test_model.dart';

class ToggleTestWidget extends StatefulWidget {
  const ToggleTestWidget({
    Key? key,
    required this.isCheck,
    required this.docID,
  }) : super(key: key);

  final bool? isCheck;
  final String? docID;

  @override
  _ToggleTestWidgetState createState() => _ToggleTestWidgetState();
}

class _ToggleTestWidgetState extends State<ToggleTestWidget> {
  late ToggleTestModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ToggleTestModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        _model.isCheck = widget.isCheck!;
      });
    });
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
      ),
      child: Align(
        alignment: AlignmentDirectional(-1.0, 0.0),
        child: ToggleIcon(
          onPressed: () async {
            setState(() => _model.isCheck = !_model.isCheck);
            _model.apiResultkr3 = await DataListCheckCall.call(
              docID: widget.docID,
            );

            setState(() {});
          },
          value: _model.isCheck,
          onIcon: Icon(
            Icons.bookmark_rounded,
            color: FlutterFlowTheme.of(context).primary,
            size: 36.0,
          ),
          offIcon: Icon(
            Icons.bookmark_border,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 36.0,
          ),
        ),
      ),
    );
  }
}
