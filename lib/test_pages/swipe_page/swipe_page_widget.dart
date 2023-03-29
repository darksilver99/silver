import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_swipeable_stack.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_card_stack/swipeable_card_stack.dart';
import 'swipe_page_model.dart';
export 'swipe_page_model.dart';

class SwipePageWidget extends StatefulWidget {
  const SwipePageWidget({Key? key}) : super(key: key);

  @override
  _SwipePageWidgetState createState() => _SwipePageWidgetState();
}

class _SwipePageWidgetState extends State<SwipePageWidget> {
  late SwipePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Kanit',
                color: Colors.white,
                fontSize: 22.0,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<UsersRecord>>(
                  stream: queryUsersRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.of(context).primaryColor,
                          ),
                        ),
                      );
                    }
                    List<UsersRecord> swipeableStackUsersRecordList =
                        snapshot.data!;
                    return FlutterFlowSwipeableStack(
                      topCardHeightFraction: 0.82,
                      middleCardHeightFraction: 0.8,
                      bottomCardHeightFraction: 0.75,
                      topCardWidthFraction: 0.9,
                      middleCardWidthFraction: 0.85,
                      bottomCardWidthFraction: 0.8,
                      onSwipeFn: (index) {},
                      onLeftSwipe: (index) {},
                      onRightSwipe: (index) {},
                      onUpSwipe: (index) {},
                      onDownSwipe: (index) {},
                      itemBuilder: (context, swipeableStackIndex) {
                        final swipeableStackUsersRecord =
                            swipeableStackUsersRecordList[swipeableStackIndex];
                        return Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 15.0, 0.0, 0.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    swipeableStackUsersRecord.displayName!,
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: swipeableStackUsersRecordList.length,
                      controller: _model.swipeableStackController,
                      enableSwipeUp: false,
                      enableSwipeDown: false,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
