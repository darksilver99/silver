import '/backend/schema/structs/index.dart';

class TestFunctionViaFlutterFlowCloudFunctionCallResponse {
  TestFunctionViaFlutterFlowCloudFunctionCallResponse({
    this.errorCode,
    this.succeeded,
    this.jsonBody,
    this.resultAsString,
    this.data,
  });
  String? errorCode;
  bool? succeeded;
  dynamic jsonBody;
  String? resultAsString;
  dynamic data;
}
