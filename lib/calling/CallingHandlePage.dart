import 'package:flutter/material.dart';
import 'package:silver/app_state.dart';
import 'package:silver/calling/calling_waitng_page/calling_waitng_page_widget.dart';
import 'package:silver/cus_fun/AgoraService.dart';
import 'package:silver/main.dart';
import 'package:provider/provider.dart';

class CallingHandlePage extends StatefulWidget {
  const CallingHandlePage({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<CallingHandlePage> createState() => _CallingHandlePageState();
}

class _CallingHandlePageState extends State<CallingHandlePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AgoraService().listenCalling();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        Container(child: widget.child),
        (FFAppState().isCallComing) ? CallingWaitngPageWidget() : Container(),
      ],
    );
  }
}
