import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'loading_view_model.dart';
export 'loading_view_model.dart';

class LoadingViewWidget extends StatefulWidget {
  const LoadingViewWidget({Key? key}) : super(key: key);

  @override
  _LoadingViewWidgetState createState() => _LoadingViewWidgetState();
}

class _LoadingViewWidgetState extends State<LoadingViewWidget> {
  late LoadingViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoadingViewModel());
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
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: Color(0x7B000000),
      ),
      child: Align(
        alignment: AlignmentDirectional(0.0, 0.0),
        child: Lottie.network(
          'https://lottie.host/a0a6c139-e4f6-4252-8768-746759e62475/jAVw2MX8Ih.json',
          width: 150.0,
          height: 250.0,
          fit: BoxFit.cover,
          animate: true,
        ),
      ),
    );
  }
}
