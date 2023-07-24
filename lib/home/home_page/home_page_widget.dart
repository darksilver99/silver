import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '/flutter_flow/flutter_flow_animations.dart';
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

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> with TickerProviderStateMixin {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeIn,
          delay: 0.ms,
          duration: 160.ms,
          begin: Offset(-35.0, 0.0),
          end: Offset(0.0, 0.0),
        ),
      ],
    ),
  };

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
    if (context.mounted) {
      final List<XFile> pickedFileList = await _picker.pickMultiImage(
        maxWidth: null,
        maxHeight: null,
        imageQuality: 80,
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
        uploadData(photoFiles, "aaa");
      }
    }
  }

  Future<void> uploadDataItOK(File photoFile, text) async {
    final url = 'https://us-central1-silver-65166.cloudfunctions.net/uploadPhoto'; // Replace this with your Firebase Cloud Function URL

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
    final url = 'https://us-central1-silver-65166.cloudfunctions.net/uploadPhotoAndGetURL'; // Replace this with your Firebase Cloud Function URL

    var request = http.MultipartRequest('POST', Uri.parse(url));
    /*for (var photoFile in photoFiles) {
      request.files.add(await http.MultipartFile.fromPath('photos', photoFile.path));
    }*/
    /*Map<String, String> headers = {"Content-type": "multipart/form-data; boundary=XXX"};
    request.headers.addAll(headers);*/
    request.fields['numPhotos'] = photoFiles.length.toString();
    for (int i = 0; i < photoFiles.length; i++) {
      var photoFile = photoFiles[i];
      request.files.add(await http.MultipartFile.fromPath('photo$i', photoFile.path));
    }

    var response = await request.send();
    if (response.statusCode == 200) {
      List<String> photoURLs = await response.stream.bytesToString().then((value) => value.split("\n").toList());
      print('Upload successful!');
      print('Photo URLs: $photoURLs');
    } else {
      print('Upload failed with status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
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
