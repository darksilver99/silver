import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'friend_list_page_model.dart';
export 'friend_list_page_model.dart';

class FriendListPageWidget extends StatefulWidget {
  const FriendListPageWidget({Key? key}) : super(key: key);

  @override
  _FriendListPageWidgetState createState() => _FriendListPageWidgetState();
}

class _FriendListPageWidgetState extends State<FriendListPageWidget> {
  late FriendListPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FriendListPageModel());
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
        backgroundColor: FlutterFlowTheme.of(context).tertiary,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).headlineMedium.override(
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
              StreamBuilder<List<UsersRecord>>(
                stream: queryUsersRecord(
                  queryBuilder: (usersRecord) =>
                      usersRecord.where('uid', isNotEqualTo: currentUserUid),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                      ),
                    );
                  }
                  List<UsersRecord> listViewUsersRecordList = snapshot.data!;
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: listViewUsersRecordList.length,
                    itemBuilder: (context, listViewIndex) {
                      final listViewUsersRecord =
                          listViewUsersRecordList[listViewIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 8.0, 16.0, 0.0),
                        child: Material(
                          color: Colors.transparent,
                          elevation: 3.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 0.0, 0.0),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      'https://picsum.photos/seed/88/600',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      listViewUsersRecord.displayName!,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Kanit',
                                            fontSize: 22.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 16.0, 0.0),
                                  child: InkWell(
                                    onTap: () async {
                                      var _shouldSetState = false;
                                      _model.chatRoomReference =
                                          await actions.getChatRoom(
                                        currentUserReference,
                                        listViewUsersRecord.reference,
                                      );
                                      _shouldSetState = true;
                                      if (_model.chatRoomReference == null) {
                                        final chatRoomListCreateData =
                                            createChatRoomListRecordData(
                                          createDate: getCurrentTimestamp,
                                          createBy: currentUserReference,
                                          status: 1,
                                          partner:
                                              listViewUsersRecord.reference,
                                        );
                                        var chatRoomListRecordReference =
                                            ChatRoomListRecord.collection.doc();
                                        await chatRoomListRecordReference
                                            .set(chatRoomListCreateData);
                                        _model.insertedData = ChatRoomListRecord
                                            .getDocumentFromData(
                                                chatRoomListCreateData,
                                                chatRoomListRecordReference);
                                        _shouldSetState = true;

                                        context.pushNamed(
                                          'ChatRoomPage',
                                          queryParams: {
                                            'chatRoomParameter': serializeParam(
                                              _model.insertedData,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chatRoomParameter':
                                                _model.insertedData,
                                          },
                                        );

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      } else {
                                        context.pushNamed(
                                          'ChatRoomPage',
                                          queryParams: {
                                            'chatRoomParameter': serializeParam(
                                              _model.chatRoomReference,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'chatRoomParameter':
                                                _model.chatRoomReference,
                                          },
                                        );

                                        if (_shouldSetState) setState(() {});
                                        return;
                                      }

                                      if (_shouldSetState) setState(() {});
                                    },
                                    child: Icon(
                                      Icons.chat,
                                      color:
                                          FlutterFlowTheme.of(context).tertiary,
                                      size: 36.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
