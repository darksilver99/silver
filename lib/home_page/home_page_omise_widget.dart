import 'dart:convert';

import 'package:omise_flutter/omise_flutter.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

import 'package:http/http.dart' as http;

class HomePageOmiseWidget extends StatefulWidget {
  const HomePageOmiseWidget({Key? key}) : super(key: key);

  @override
  _HomePageOmiseWidgetState createState() => _HomePageOmiseWidgetState();
}

class _HomePageOmiseWidgetState extends State<HomePageOmiseWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  static const publicKey = "pkey_test_5x1h5fbuqkwm8g53lm0";
  OmiseFlutter omise = OmiseFlutter(publicKey);

  exampleCreateToken() async {
    print(">>>>>>>>>>>>>>exampleCreateToken");
    try {
      final token = await omise.token.create("John Doe", "4242424242424242", "12", "2024", "123");
      /*print("token.object : ${token.object}");
      print("token.id : ${token.id}");
      print("token.livemode : ${token.livemode}");
      print("token.location : ${token.location}");
      print("token.chargeStatus : ${token.chargeStatus}");
      print("token.createdAt : ${token.createdAt}");
      print("token.used : ${token.used}");
      print("token.card : ${token.card}");
      print(token.card!.bank);*/
      //exampleCreateSource();
      payment(token.id);
    } catch (e) {
      error(e);
    }
  }

  String basicAuth(publicKey) {
    return 'Basic ' + base64Encode(utf8.encode('$publicKey:'));
  }

  payment(token) async {
    print("payment");
    print(token.runtimeType);
    print(token);

    final url = 'https://api.omise.co/charges';
    /*var header = {
      "secretKey": 'skey_test_5x1cv8dk84i1twgjbxv',
      "omiseVersion": '2019-05-29',
    };*/

    // อันนี้ได้
    Map<String, String> header = {
      'Authorization': basicAuth("skey_test_5x1cv8dk84i1twgjbxv"),
      'Omise-Version': '2019-05-29',
      'Cache-Control': 'no-cache',
      'Content-Type': 'application/json',
      'user-agent': 'co.keerati.omise_flutter/0.1.6'
    };

    print("header");
    print(header);

    var requestBody = {
      'description': "Charge for order 0001",
      'amount': "90000",
      'currency': "THB",
      'return_uri': "http://www.example.com/orders/3947/complete",
      'card': token,
    };

    print("requestBody");
    print(requestBody);

    var response = await http.post(Uri.parse(url), body: jsonEncode(requestBody), headers: header);

    if (response.statusCode == 200) {
      print('Upload successful!');
      print('Photo URL: ${response.body}');
    } else {
      print('Upload failed with status code: ${response.statusCode}');
      print('${response.body}');
    }
  }

  exampleCreateSource() async {
    print(">>>>>>>>>>>>>>exampleCreateSource");
    try {
      final source = await omise.source.create(10000, "thb", "internet_banking_bay");

      print("source.object : ${source.object}");
      print("source.id : ${source.id}");
      print("source.livemode : ${source.livemode}");
      print("source.location : ${source.location}");
      print("source.createdAt : ${source.createdAt}");
      print("source.type : ${source.type}");
      print("source.flow : ${source.flow}");
      print("source.amount : ${source.amount}");
      print("source.currency : ${source.currency}");
      print("source.mobileNumber : ${source.mobileNumber}");
      print("source.phoneNumber : ${source.phoneNumber}");
      print("source.references : ${source.references}");
      print("source.name : ${source.name}");
      print("source.email : ${source.email}");
      print("source.barcode : ${source.barcode}");
      print("source.storeId : ${source.storeId}");
      print("source.storeName : ${source.storeName}");
      print("source.terminalId : ${source.terminalId}");
      print("source.installmentTerm : ${source.installmentTerm}");
      print("source.zeroInterestInstallments : ${source.zeroInterestInstallments}");
      print("source.scannableCode : ${source.scannableCode}");
      //exampleRetrieveCapability();
    } catch (e) {
      error(e);
    }
  }

  exampleRetrieveCapability() async {
    print(">>>>>>>>>>>>>>exampleRetrieveCapability");
    final capability = await omise.capability.retrieve();

    print("capability.object : ${capability.object}");
    print("capability.location : ${capability.location}");
    print("capability.banks : ${capability.banks}");
    print("capability.zeroInterestInstallments : ${capability.zeroInterestInstallments}");
    for (var i = 0; i < capability.paymentMethods!.length; i++) {
      print(">>>>>$i");
      print("capability.paymentMethods.object : ${capability.paymentMethods![i].object}");
      print("capability.paymentMethods.name : ${capability.paymentMethods![i].name}");
      print("capability.paymentMethods.currencies : ${capability.paymentMethods![i].currencies}");
      print("capability.paymentMethods.cardBrands : ${capability.paymentMethods![i].cardBrands}");
      print("capability.paymentMethods.installmentTerms : ${capability.paymentMethods![i].installmentTerms}");
    }
  }

  error(e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          e.toString(),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryBackground,
                fontSize: 12.0,
              ),
        ),
        duration: Duration(milliseconds: 4000),
        backgroundColor: FlutterFlowTheme.of(context).primary,
      ),
    );
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('TestPage');
                    },
                    text: 'testPage',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                      elevation: 3.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      print("adada");
                      exampleCreateToken();
                      //exampleCreateSource();
                      //exampleRetrieveCapability();
                    },
                    text: 'omise pay',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 40.0,
                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                          ),
                      elevation: 3.0,
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
    );
  }
}
