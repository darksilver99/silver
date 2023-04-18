import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'booking_form_page_model.dart';
export 'booking_form_page_model.dart';

class BookingFormPageWidget extends StatefulWidget {
  const BookingFormPageWidget({Key? key}) : super(key: key);

  @override
  _BookingFormPageWidgetState createState() => _BookingFormPageWidgetState();
}

class _BookingFormPageWidgetState extends State<BookingFormPageWidget> {
  late BookingFormPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingFormPageModel());

    _model.subjectController ??= TextEditingController();
    _model.detailController ??= TextEditingController();
    _model.priceController ??= TextEditingController();
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
          leading: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
            child: Material(
              color: Colors.transparent,
              elevation: 3.0,
              shape: const CircleBorder(),
              child: Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.chevron_left_rounded,
                  color: Colors.black,
                  size: 24.0,
                ),
              ),
            ),
          ),
          title: Text(
            'เพิ่มข้อมูลบริการของท่าน',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Kanit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                child: Material(
                  color: Colors.transparent,
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 32.0),
                      child: Form(
                        key: _model.formKey,
                        autovalidateMode: AutovalidateMode.disabled,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                              child: TextFormField(
                                controller: _model.subjectController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'ชื่อบริการของคุณ',
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
                                      color: FlutterFlowTheme.of(context).alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.subjectControllerValidator.asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                              child: TextFormField(
                                controller: _model.detailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'รายละเอียดเพิ่มเติม (หากมี)',
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
                                      color: FlutterFlowTheme.of(context).alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.detailControllerValidator.asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                              child: TextFormField(
                                controller: _model.priceController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'ช่วงราคา',
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
                                      color: FlutterFlowTheme.of(context).alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).alternate,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(16.0),
                                  ),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                keyboardType: TextInputType.number,
                                validator: _model.priceControllerValidator.asValidator(context),
                                inputFormatters: [_model.priceMask],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                height: 320.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).lineColor,
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            'ที่ตั้งร้าน',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context).bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                      child: Container(
                                        width: double.infinity,
                                        height: 250.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).alternate,
                                          borderRadius: BorderRadius.circular(0.0),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                  borderRadius: BorderRadius.circular(16.0),
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context).lineColor,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'รูปภาพ',
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                        child: Builder(
                                          builder: (context) {
                                            final photoList = _model.uploadedFileUrls.toList();
                                            return Wrap(
                                              spacing: 4.0,
                                              runSpacing: 4.0,
                                              alignment: WrapAlignment.start,
                                              crossAxisAlignment: WrapCrossAlignment.start,
                                              direction: Axis.horizontal,
                                              runAlignment: WrapAlignment.start,
                                              verticalDirection: VerticalDirection.down,
                                              clipBehavior: Clip.none,
                                              children: List.generate(photoList.length, (photoListIndex) {
                                                final photoListItem = photoList[photoListIndex];
                                                return Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                    borderRadius: BorderRadius.circular(16.0),
                                                  ),
                                                  child: Stack(
                                                    alignment: AlignmentDirectional(0.9000000000000001, -0.9),
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(16.0),
                                                        child: Image.network(
                                                          'https://picsum.photos/seed/322/600',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          await FirebaseStorage.instance.refFromURL(photoListItem).delete();
                                                        },
                                                        child: Icon(
                                                          Icons.cancel_sharp,
                                                          color: FlutterFlowTheme.of(context).error,
                                                          size: 24.0,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  final selectedMedia = await selectMedia(
                                                    maxWidth: 200.00,
                                                    imageQuality: 100,
                                                    mediaSource: MediaSource.photoGallery,
                                                    multiImage: true,
                                                  );
                                                  if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                    setState(() => _model.isDataUploading = true);
                                                    var selectedUploadedFiles = <FFUploadedFile>[];
                                                    var downloadUrls = <String>[];
                                                    try {
                                                      showUploadMessage(
                                                        context,
                                                        'Uploading file...',
                                                        showLoading: true,
                                                      );
                                                      selectedUploadedFiles = selectedMedia
                                                          .map((m) => FFUploadedFile(
                                                                name: m.storagePath.split('/').last,
                                                                bytes: m.bytes,
                                                                height: m.dimensions?.height,
                                                                width: m.dimensions?.width,
                                                              ))
                                                          .toList();

                                                      downloadUrls = (await Future.wait(
                                                        selectedMedia.map(
                                                          (m) async => await uploadData(m.storagePath, m.bytes),
                                                        ),
                                                      ))
                                                          .where((u) => u != null)
                                                          .map((u) => u!)
                                                          .toList();
                                                    } finally {
                                                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                      _model.isDataUploading = false;
                                                    }
                                                    if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                      setState(() {
                                                        _model.uploadedLocalFiles = selectedUploadedFiles;
                                                        _model.uploadedFileUrls = downloadUrls;
                                                      });
                                                      showUploadMessage(context, 'Success!');
                                                    } else {
                                                      setState(() {});
                                                      showUploadMessage(context, 'Failed to upload data');
                                                      return;
                                                    }
                                                  }
                                                },
                                                text: 'อัพโหลดรูปภาพ',
                                                icon: Icon(
                                                  Icons.file_upload,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                        fontFamily: 'Kanit',
                                                        color: Colors.white,
                                                      ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8.0),
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
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.formKey.currentState == null || !_model.formKey.currentState!.validate()) {
                                    return;
                                  }

                                  final bookingListCreateData = {
                                    ...createBookingListRecordData(
                                      createDate: getCurrentTimestamp,
                                      createBy: currentUserReference,
                                      status: 1,
                                      subject: _model.subjectController.text,
                                      detail: _model.detailController.text,
                                      price: int.tryParse(_model.priceController.text),
                                    ),
                                    'photo': _model.uploadedFileUrls,
                                  };
                                  await BookingListRecord.collection.doc().set(bookingListCreateData);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'บันทึกข้อมูลเรียบร้อยแล้ว',
                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                              fontFamily: 'Kanit',
                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                            ),
                                      ),
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                                    ),
                                  );
                                  context.safePop();
                                },
                                text: 'บันทึก',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).success,
                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                        fontFamily: 'Kanit',
                                        color: Colors.white,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
