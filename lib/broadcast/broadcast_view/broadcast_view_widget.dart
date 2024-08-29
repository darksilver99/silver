import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/cloud_functions/cloud_functions.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_mux_broadcast.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:io' show Platform;
import 'package:apivideo_live_stream/apivideo_live_stream.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'broadcast_view_model.dart';
export 'broadcast_view_model.dart';

class BroadcastViewWidget extends StatefulWidget {
  const BroadcastViewWidget({
    super.key,
    required this.broadcastName,
  });

  final String? broadcastName;

  @override
  State<BroadcastViewWidget> createState() => _BroadcastViewWidgetState();
}

class _BroadcastViewWidgetState extends State<BroadcastViewWidget> {
  late BroadcastViewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? muxBroadcastPlaybackUrl;
  bool muxBroadcastIsLive = false;
  LiveStreamController? muxBroadcastController;
  final _initialAudioConfig = AudioConfig(
    channel: Channel.stereo,
  );
  final _initialVideoConfig = VideoConfig.withDefaultBitrate(
    resolution: Resolution.RESOLUTION_720,
  );
  // variables for managing camera states
  bool _isCameraInitialized = false;
  bool _isFrontCamSelected = false;
  final _stopwatch = Stopwatch();
  String? _durationString;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BroadcastViewModel());

    if (Platform.isAndroid || Platform.isIOS) {
      _initCamera();
    }
  }

  @override
  void dispose() {
    _model.dispose();

    _stopwatch.stop();
    _timer?.cancel();
    WakelockPlus.disable();

    super.dispose();
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
            'Broadcast View',
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FlutterFlowMuxBroadcast(
                  isCameraInitialized: _isCameraInitialized,
                  isStreaming: muxBroadcastIsLive,
                  durationString: _durationString,
                  borderRadius: BorderRadius.circular(0.0),
                  controller: muxBroadcastController,
                  videoConfig: _initialVideoConfig,
                  onCameraRotateButtonTap: () async {
                    await switchCamera();
                    setState(() => _isFrontCamSelected = !_isFrontCamSelected);
                  },
                  startButtonText: 'Start Stream',
                  startButtonIcon: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  startButtonOptions: FFButtonOptions(
                    width: 160.0,
                    height: 50.0,
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  liveIcon: FaIcon(
                    FontAwesomeIcons.solidCircle,
                    color: Colors.red,
                    size: 10.0,
                  ),
                  liveText: 'Live',
                  liveTextStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Montserrat',
                            color: Colors.red,
                            letterSpacing: 0.0,
                          ),
                  liveTextBackgroundColor: Color(0x8A000000),
                  durationTextStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Montserrat',
                            color: Colors.red,
                            letterSpacing: 0.0,
                          ),
                  durationTextBackgroundColor: Color(0x8A000000),
                  liveContainerBorderRadius: BorderRadius.circular(8.0),
                  durationContainerBorderRadius: BorderRadius.circular(8.0),
                  rotateButtonColor: Color(0x8A000000),
                  rotateButtonIcon: Icon(
                    Icons.flip_camera_android,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  stopButtonIcon: Icon(
                    Icons.stop_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  stopButtonColor: Colors.red,
                  onStartButtonTap: () async {
                    await startStreaming();

                    var broadcastListRecordReference =
                        BroadcastListRecord.collection.doc();
                    await broadcastListRecordReference
                        .set(createBroadcastListRecordData(
                      createDate: getCurrentTimestamp,
                      createBy: currentUserReference,
                      isLive: true,
                      name: widget!.broadcastName,
                      url: muxBroadcastPlaybackUrl,
                    ));
                    _model.rsBroadcast =
                        BroadcastListRecord.getDocumentFromData(
                            createBroadcastListRecordData(
                              createDate: getCurrentTimestamp,
                              createBy: currentUserReference,
                              isLive: true,
                              name: widget!.broadcastName,
                              url: muxBroadcastPlaybackUrl,
                            ),
                            broadcastListRecordReference);

                    setState(() {});
                  },
                  onStopButtonTap: () async {
                    stopStreaming();

                    await _model.rsBroadcast!.reference
                        .update(createBroadcastListRecordData(
                      isLive: false,
                    ));
                    context.safePop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _initCamera() async {
    muxBroadcastController = initLiveStreamController();
    await muxBroadcastController!.create(
      initialAudioConfig: _initialAudioConfig,
      initialVideoConfig: _initialVideoConfig,
    );
    setState(() => _isCameraInitialized = true);
  }

  LiveStreamController initLiveStreamController() {
    return LiveStreamController(
      onConnectionSuccess: () {
        print('Connection succeeded');
        setState(() => muxBroadcastIsLive = true);
        _startTimer();
      },
      onConnectionFailed: (error) {
        print('Connection failed: $error');
        if (mounted) setState(() {});
      },
      onDisconnection: () {
        print('Disconnected');
        if (mounted) setState(() => muxBroadcastIsLive = false);
        _stopTimer();
      },
    );
  }

  Future<void> switchCamera() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      liveStreamController.switchCamera();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to switch camera: ${error.message}');
      } else {
        print('Failed to switch camera: $error');
      }
    }
  }

  Future<void> startStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    const streamBaseURL = 'rtmps://global-live.mux.com:443/app/';
    final callName = 'createLiveStream';
    final response = await makeCloudCall(callName, {'latency_mode': 'low'});
    final streamKey = response['stream_key'];
    final playbackId = response['playback_ids'][0]['id'];
    muxBroadcastPlaybackUrl = 'https://stream.mux.com/$playbackId.m3u8';
    if (streamKey != null) {
      try {
        WakelockPlus.enable();
        await liveStreamController.startStreaming(
          streamKey: streamKey,
          url: streamBaseURL,
        );
      } catch (error) {
        if (error is PlatformException) {
          print("Error: failed to start stream: ${error.message}");
        } else {
          print("Error: failed to start stream: $error");
        }
      }
    }
  }

  Future<void> stopStreaming() async {
    final LiveStreamController? liveStreamController = muxBroadcastController;
    if (liveStreamController == null) return;
    try {
      WakelockPlus.disable();
      liveStreamController.stopStreaming();
      if (mounted) setState(() => muxBroadcastIsLive = false);
      _stopTimer();
    } catch (error) {
      if (error is PlatformException) {
        print('Failed to stop stream: ${error.message}');
      } else {
        print('Failed to stop stream: $error');
      }
    }
  }

  void _startTimer() {
    _stopwatch.start();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _durationString = _getDurationString(_stopwatch.elapsed);
        });
      }
    });
  }

  void _stopTimer() {
    _stopwatch
      ..stop()
      ..reset();
    _durationString = _getDurationString(_stopwatch.elapsed);
    _timer?.cancel();
  }

  String _getDurationString(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }
}
