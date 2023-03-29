import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetProvinceListCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'getProvinceList',
      apiUrl: 'https://asia-east2-silver-65166.cloudfunctions.net/helloWorld',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic dataList(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
}

class AddProvinceCall {
  static Future<ApiCallResponse> call({
    String? name = '',
    String? postCode = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'addProvince',
      apiUrl: 'https://asia-east2-silver-65166.cloudfunctions.net/addProvince',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'name': name,
        'postCode': postCode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic status(dynamic response) => getJsonField(
        response,
        r'''$.status''',
      );
  static dynamic msg(dynamic response) => getJsonField(
        response,
        r'''$.msg''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar) {
  jsonVar ??= {};
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return '{}';
  }
}
