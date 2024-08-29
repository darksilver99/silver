import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:silver/cus_fun/AgoraService.dart';

import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calling_page_model.dart';
export 'calling_page_model.dart';

typedef OnHangUpCallback = void Function(dynamic);

class CallingPageWidget extends StatefulWidget {
  const CallingPageWidget({
    super.key,
    required this.userParameter,
    bool? isCaller,
    this.onHangUp
  })  : this.isCaller = isCaller ?? false;

  final UsersRecord? userParameter;
  final bool isCaller;
  final OnHangUpCallback? onHangUp;

  @override
  State<CallingPageWidget> createState() => _CallingPageWidgetState();
}

class _CallingPageWidgetState extends State<CallingPageWidget> {
  late CallingPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallingPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();

      FFAppState().update(() {
        FFAppState().isCallComing = false;
      });

      if(!widget.isCaller){
        _engine = createAgoraRtcEngine();
        await _engine.initialize(const RtcEngineContext(
          appId: "77be9babb28c42728fbc98285dea623a",
          channelProfile: ChannelProfileType.channelProfileCommunication,
        ));

        _engine.registerEventHandler(
          RtcEngineEventHandler(
            onUserOffline: (RtcConnection connection, int remoteUid, UserOfflineReasonType reason) {
              debugPrint("aaaaaaaaaaa remote user $remoteUid left channel");
              hangUp();
            },
          ),
        );

        await _engine.joinChannel(
          token: "007eJxTYKiSXJLwfdJ8zbrHJ9gT/Cola0WvHT55uj+srPXL1fl717IrMJibJ6VaJiUmJRlZJJsYmRtZpCUlW1oYWZimpCaaGRkn6vw1SG0IZGRY1RHPzMgAgSA+I4MhAwMAUGUfZw==",
          channelId: "1",
          uid: 0,
          options: const ChannelMediaOptions(),
        );
      }

    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  hangUp() async {
    await _engine.leaveChannel();
    await _engine.release();
    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
            'Calling Page',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Kanit',
                  color: FlutterFlowTheme.of(context).primary,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 3.0,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                      child: Text(
                        widget!.userParameter!.displayName,
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Montserrat',
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlutterFlowTimer(
                        initialTime: _model.timerInitialTimeMs,
                        getDisplayTime: (value) =>
                            StopWatchTimer.getDisplayTime(
                          value,
                          hours: false,
                          milliSecond: false,
                        ),
                        controller: _model.timerController,
                        updateStateInterval: Duration(milliseconds: 1000),
                        onChanged: (value, displayTime, shouldUpdate) {
                          _model.timerMilliseconds = value;
                          _model.timerValue = displayTime;
                          if (shouldUpdate) setState(() {});
                        },
                        textAlign: TextAlign.start,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: 'Montserrat',
                                  letterSpacing: 0.0,
                                ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      _model.timerController.onStopTimer();
                      FirebaseFirestore.instance.doc(FFAppState().callRoomPath).update({"is_end":true});
                      if(widget.isCaller){
                        FFAppState().update(() {
                          FFAppState().isHangUp = false;
                        });
                        widget.onHangUp!(true);
                      }else{
                       hangUp();
                      }
                    },
                    child: Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).error,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                        child: Icon(
                          Icons.add_call,
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          size: 42.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
