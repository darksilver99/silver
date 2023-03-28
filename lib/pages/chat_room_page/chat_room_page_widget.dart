import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/owner_chat_view_widget.dart';
import '/components/partner_chat_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).tertiaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
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
                            color: FlutterFlowTheme.of(context).primaryColor,
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
                              PartnerChatViewWidget(
                                key: Key(
                                    'Keyex7_${listViewIndex}_of_${listViewChatRoomSubListRecordList.length}'),
                                message: listViewChatRoomSubListRecord.message,
                                userParameter:
                                    listViewChatRoomSubListRecord.createBy,
                              ),
                            if (widget.chatRoomParameter!.createBy ==
                                currentUserReference)
                              OwnerChatViewWidget(
                                key: Key(
                                    'Key8b0_${listViewIndex}_of_${listViewChatRoomSubListRecordList.length}'),
                                message: listViewChatRoomSubListRecord.message,
                                userParameter:
                                    listViewChatRoomSubListRecord.createBy,
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
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
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
                          style: FlutterFlowTheme.of(context).bodyText1,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: InkWell(
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
                            FFAppState().temporaryMessage = '';
                            return;
                          } else {
                            return;
                          }
                        },
                        child: Icon(
                          Icons.send,
                          color: FlutterFlowTheme.of(context).tertiaryColor,
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
