import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'no_data_view_model.dart';
export 'no_data_view_model.dart';

class NoDataViewWidget extends StatefulWidget {
  const NoDataViewWidget({Key? key}) : super(key: key);

  @override
  _NoDataViewWidgetState createState() => _NoDataViewWidgetState();
}

class _NoDataViewWidgetState extends State<NoDataViewWidget> {
  late NoDataViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NoDataViewModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.00, 0.00),
      child: Text(
        'No Data!',
        style: FlutterFlowTheme.of(context).bodyMedium,
      ),
    );
  }
}
