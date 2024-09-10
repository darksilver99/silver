import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

import 'package:http/http.dart' as http;

// อัพโหลดไฟล์ ผ่าน firebase function (nodejs) เข้า storage ของ firebase

class HomePageCustomWidget extends StatefulWidget {
  const HomePageCustomWidget({Key? key}) : super(key: key);

  @override
  _HomePageCustomWidgetState createState() => _HomePageCustomWidgetState();
}

class _HomePageCustomWidgetState extends State<HomePageCustomWidget> with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<XFile>? _mediaFileList;

  void _setImageFileListFromFile(XFile? value) {
    _mediaFileList = value == null ? null : <XFile>[value];
  }

  dynamic _pickImageError;
  bool isVideo = false;

  String? _retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  Future<void> _onImageButtonPressed(
    ImageSource source, {
    required BuildContext context,
    bool isMultiImage = false,
    bool isMedia = false,
  }) async {
    /*if (context.mounted) {
      final List<XFile> pickedFileList = await _picker.pickMultiImage(
        maxWidth: null,
        maxHeight: 200,
        imageQuality: 50,
      );

      setState(() {
        _mediaFileList = pickedFileList;
      });

      print("_mediaFileList");
      if (_mediaFileList!.isNotEmpty) {
        print(_mediaFileList!.length);
        print(_mediaFileList![0].path);
        File file = File(_mediaFileList![0].path);
        //uploadData(file, "text");

        List<File> photoFiles = [];
        for (var i = 0; i < _mediaFileList!.length; i++) {
          photoFiles.add(File(_mediaFileList![i].path));
        }

        //uploadDataIsOK(file, "aaa");
        uploadData(photoFiles, "aaa");
      }
    }*/
  }

  Future<void> uploadDataIsOK(File photoFile, text) async {
    final url = 'https://42ce-58-11-120-194.ngrok-free.app/silver-65166/us-central1/uploadPhoto'; // Replace this with your Firebase Cloud Function URL

    List<int> photoBytes = await photoFile.readAsBytes();
    String photoBase64 = base64Encode(photoBytes);

    var requestBody = {
      'photo': photoBase64,
    };

    var response = await http.post(Uri.parse(url), body: requestBody);

    if (response.statusCode == 200) {
      print('Upload successful!');
      print('Photo URL: ${response.body}');
    } else {
      print('Upload failed with status code: ${response.statusCode}');
    }
  }

  Future<void> uploadData(List<File> photoFiles, text) async {
    final url = 'https://42ce-58-11-120-194.ngrok-free.app/silver-65166/us-central1/uploadPhotoAndGetURL'; // Replace this with your Firebase Cloud Function URL

    /* List<int> photoBytes = await photoFile.readAsBytes();
    String photoBase64 = base64Encode(photoBytes);*/

    List<String> photoBase64List = [];
    for (var i = 0; i < photoFiles.length; i++) {
      List<int> photoBytes = await photoFiles[i].readAsBytes();
      photoBase64List.add(base64Encode(photoBytes));
    }
    String photoBase64String = photoBase64List.join(",");
    var requestBody = {
      'photo': photoBase64String,
    };

    var response = await http.post(Uri.parse(url), body: requestBody);

    if (response.statusCode == 200) {
      print('Upload successful!');
      print('Photo URL: ${response.body}');
    } else {
      print('Upload failed with status code: ${response.statusCode}');
    }
  }

  Future<void> uploadData2(List<File> photoFiles, text) async {
    final url = 'https://42ce-58-11-120-194.ngrok-free.app/silver-65166/us-central1/uploadPhotoAndGetURL'; // Replace this with your Firebase Cloud Function URL

    var request = http.MultipartRequest('POST', Uri.parse(url));

    for (int i = 0; i < photoFiles.length; i++) {
      var photoFile = photoFiles[i];
      request.files.add(await http.MultipartFile.fromPath('photos', photoFile.path));
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      String responseString = await response.stream.bytesToString();
      print('Upload successful!');
      print('Response: $responseString');
    } else {
      print('Upload failed with status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      //onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          automaticallyImplyLeading: false,
          actions: [],
          centerTitle: false,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              final testList = FFAppState().monthList.toList();
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        _onImageButtonPressed(
                          ImageSource.gallery,
                          context: context,
                          isMultiImage: true,
                        );
                      },
                      child: Container(
                        height: 40,
                        color: Colors.grey,
                        child: Text("uuuu"),
                      ),
                    ),
                  ],
                  /*  children: List.generate(testList.length, (testListIndex) {
                    final testListItem = testList[testListIndex];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
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
                          child: Text(
                            'Hello World',
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ).animateOnPageLoad(
                          animationsMap['containerOnPageLoadAnimation']!),
                    );
                  }),*/
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

typedef OnPickImageCallback = void Function(double? maxWidth, double? maxHeight, int? quality);
