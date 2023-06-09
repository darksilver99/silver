import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/owner_chat_view_widget.dart';
import '/components/partner_chat_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'chat_room_page_model.dart';
export 'chat_room_page_model.dart';

class ChatRoomPageWidget extends StatefulWidget {
  const ChatRoomPageWidget({
    Key? key,
    this.chatRoomParameter,
  }) : super(key: key);

  final ChatRoomListRecord? chatRoomParameter;

  @override
  _ChatRoomPageWidgetState createState() => _ChatRoomPageWidgetState();
}

class _ChatRoomPageWidgetState extends State<ChatRoomPageWidget> {
  late ChatRoomPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatRoomPageModel());

    _model.textController ??= TextEditingController();
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

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).tertiary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: FaIcon(
              FontAwesomeIcons.arrowCircleLeft,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Kanit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.call_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                FFAppState().roomID = widget.chatRoomParameter!.reference.id;
                if (widget.chatRoomParameter!.createBy ==
                    currentUserReference) {
                  final usersUpdateData1 = createUsersRecordData(
                    roomIDCalling: FFAppState().roomID,
                    isCalling: true,
                  );
                  await widget.chatRoomParameter!.partner!
                      .update(usersUpdateData1);

                  final usersUpdateData2 = createUsersRecordData(
                    isCalling: true,
                  );
                  await widget.chatRoomParameter!.createBy!
                      .update(usersUpdateData2);
                } else {
                  final usersUpdateData3 = createUsersRecordData(
                    roomIDCalling: FFAppState().roomID,
                    isCalling: true,
                  );
                  await widget.chatRoomParameter!.createBy!
                      .update(usersUpdateData3);

                  final usersUpdateData4 = createUsersRecordData(
                    isCalling: true,
                  );
                  await widget.chatRoomParameter!.partner!
                      .update(usersUpdateData4);
                }

                context.pushNamed('CallingPage');
              },
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<ChatRoomSubListRecord>>(
                  stream: queryChatRoomSubListRecord(
                    parent: widget.chatRoomParameter!.reference,
                    queryBuilder: (chatRoomSubListRecord) =>
                        chatRoomSubListRecord
                            .where('status', isEqualTo: 1)
                            .orderBy('create_date', descending: true),
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
                    List<ChatRoomSubListRecord>
                        listViewChatRoomSubListRecordList = snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      reverse: true,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewChatRoomSubListRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewChatRoomSubListRecord =
                            listViewChatRoomSubListRecordList[listViewIndex];
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if (listViewChatRoomSubListRecord.createBy !=
                                currentUserReference)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 46.0, 0.0),
                                child: PartnerChatViewWidget(
                                  key: Key(
                                      'Keyex7_${listViewIndex}_of_${listViewChatRoomSubListRecordList.length}'),
                                  message:
                                      listViewChatRoomSubListRecord.message,
                                  userParameter:
                                      listViewChatRoomSubListRecord.createBy,
                                ),
                              ),
                            if (listViewChatRoomSubListRecord.createBy ==
                                currentUserReference)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    46.0, 0.0, 8.0, 0.0),
                                child: OwnerChatViewWidget(
                                  key: Key(
                                      'Key8b0_${listViewIndex}_of_${listViewChatRoomSubListRecordList.length}'),
                                  message:
                                      listViewChatRoomSubListRecord.message,
                                  userParameter:
                                      listViewChatRoomSubListRecord.createBy,
                                ),
                              ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 72.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: '[Some hint text...]',
                            hintStyle: FlutterFlowTheme.of(context).bodySmall,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyMedium,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (_model.textController.text != null &&
                              _model.textController.text != '') {
                            FFAppState().temporaryMessage =
                                _model.textController.text;
                            setState(() {
                              _model.textController?.clear();
                            });

                            final chatRoomSubListCreateData =
                                createChatRoomSubListRecordData(
                              createBy: currentUserReference,
                              createDate: getCurrentTimestamp,
                              status: 1,
                              message: FFAppState().temporaryMessage,
                            );
                            await ChatRoomSubListRecord.createDoc(
                                    widget.chatRoomParameter!.reference)
                                .set(chatRoomSubListCreateData);

                            final chatRoomListUpdateData =
                                createChatRoomListRecordData(
                              updateDate: getCurrentTimestamp,
                              lastMessage: FFAppState().temporaryMessage,
                            );
                            await widget.chatRoomParameter!.reference
                                .update(chatRoomListUpdateData);
                            if (widget.chatRoomParameter!.createBy ==
                                currentUserReference) {
                              FFAppState().singleUser =
                                  widget.chatRoomParameter!.partner;
                              triggerPushNotification(
                                notificationTitle: currentUserDisplayName,
                                notificationText: FFAppState().temporaryMessage,
                                userRefs: [FFAppState().singleUser!],
                                initialPageName: 'ChatRoomPage',
                                parameterData: {
                                  'chatRoomParameter': widget.chatRoomParameter,
                                },
                              );
                            } else {
                              FFAppState().singleUser =
                                  widget.chatRoomParameter!.createBy;
                              triggerPushNotification(
                                notificationTitle: currentUserDisplayName,
                                notificationText: FFAppState().temporaryMessage,
                                userRefs: [FFAppState().singleUser!],
                                initialPageName: 'ChatRoomPage',
                                parameterData: {
                                  'chatRoomParameter': widget.chatRoomParameter,
                                },
                              );
                            }

                            FFAppState().temporaryMessage = '';
                            FFAppState().singleUser = null;
                            FFAppState().multipleUsers = [];
                            return;
                          } else {
                            return;
                          }
                        },
                        child: Icon(
                          Icons.send,
                          color: FlutterFlowTheme.of(context).tertiary,
                          size: 36.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
