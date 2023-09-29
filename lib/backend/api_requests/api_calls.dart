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
      apiUrl:
          'https://asia-east2-silver-65166.cloudfunctions.net/provincesList',
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
  static dynamic dataID(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@)].id''',
        true,
      );
  static dynamic dataName(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@)].name''',
        true,
      );
  static dynamic dataPostCode(dynamic response) => getJsonField(
        response,
        r'''$.data[?(@)].postCode''',
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

class DeleteProvinceCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'deleteProvince',
      apiUrl:
          'https://asia-east2-silver-65166.cloudfunctions.net/deleteProvince',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'id': id,
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

class DataListCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'dataList',
      apiUrl: 'https://asia-east2-silver-65166.cloudfunctions.net/dataList',
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
  static dynamic msg(dynamic response) => getJsonField(
        response,
        r'''$.msg''',
      );
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
        true,
      );
  static dynamic name(dynamic response) => getJsonField(
        response,
        r'''$.data[:].name''',
        true,
      );
  static dynamic detail(dynamic response) => getJsonField(
        response,
        r'''$.data[:].detail''',
        true,
      );
  static dynamic searchText(dynamic response) => getJsonField(
        response,
        r'''$.data[:].searchText''',
        true,
      );
  static dynamic ischeck(dynamic response) => getJsonField(
        response,
        r'''$.data[:].is_check''',
        true,
      );
  static dynamic id(dynamic response) => getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      );
}

class DataListDelCall {
  static Future<ApiCallResponse> call({
    String? docID = 'test',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'dataListDel',
      apiUrl: 'https://asia-east2-silver-65166.cloudfunctions.net/dataListDel',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'docID': docID,
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

class DataListCheckCall {
  static Future<ApiCallResponse> call({
    String? docID = 'test',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'dataListCheck',
      apiUrl:
          'https://asia-east2-silver-65166.cloudfunctions.net/dataListCheck',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'docID': docID,
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

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
