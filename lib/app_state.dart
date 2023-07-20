import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _monthList = prefs.getStringList('ff_monthList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _monthList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<dynamic> _monthList = [
    jsonDecode('{\"month\":\"1\"}'),
    jsonDecode('{\"month\":\"1\"}'),
    jsonDecode('{\"month\":\"1\"}'),
    jsonDecode('{\"month\":\"1\"}'),
    jsonDecode('{\"month\":\"1\"}')
  ];
  List<dynamic> get monthList => _monthList;
  set monthList(List<dynamic> _value) {
    _monthList = _value;
    prefs.setStringList(
        'ff_monthList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToMonthList(dynamic _value) {
    _monthList.add(_value);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMonthList(dynamic _value) {
    _monthList.remove(_value);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMonthList(int _index) {
    _monthList.removeAt(_index);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }

  void updateMonthListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _monthList[_index] = updateFn(_monthList[_index]);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
