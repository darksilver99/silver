import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

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
    _safeInit(() {
      if (prefs.containsKey('ff_userData')) {
        try {
          _userData = jsonDecode(prefs.getString('ff_userData') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _tripCreatedMapList =
          prefs.getStringList('ff_tripCreatedMapList')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _tripCreatedMapList;
    });
    _safeInit(() {
      _homeOfflineDataList =
          prefs.getStringList('ff_homeOfflineDataList')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _homeOfflineDataList;
    });
    _safeInit(() {
      _tripOfflineDetail =
          prefs.getStringList('ff_tripOfflineDetail')?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _tripOfflineDetail;
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

  void insertAtIndexInMonthList(int _index, dynamic _value) {
    _monthList.insert(_index, _value);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }

  dynamic _userData;
  dynamic get userData => _userData;
  set userData(dynamic _value) {
    _userData = _value;
    prefs.setString('ff_userData', jsonEncode(_value));
  }

  List<dynamic> _tripCreatedMapList = [];
  List<dynamic> get tripCreatedMapList => _tripCreatedMapList;
  set tripCreatedMapList(List<dynamic> _value) {
    _tripCreatedMapList = _value;
    prefs.setStringList(
        'ff_tripCreatedMapList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToTripCreatedMapList(dynamic _value) {
    _tripCreatedMapList.add(_value);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTripCreatedMapList(dynamic _value) {
    _tripCreatedMapList.remove(_value);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTripCreatedMapList(int _index) {
    _tripCreatedMapList.removeAt(_index);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  void updateTripCreatedMapListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tripCreatedMapList[_index] = updateFn(_tripCreatedMapList[_index]);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTripCreatedMapList(int _index, dynamic _value) {
    _tripCreatedMapList.insert(_index, _value);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  dynamic _tripCreatedMapData;
  dynamic get tripCreatedMapData => _tripCreatedMapData;
  set tripCreatedMapData(dynamic _value) {
    _tripCreatedMapData = _value;
  }

  dynamic _selectedLocationPlace;
  dynamic get selectedLocationPlace => _selectedLocationPlace;
  set selectedLocationPlace(dynamic _value) {
    _selectedLocationPlace = _value;
  }

  dynamic _manualUploadBooking;
  dynamic get manualUploadBooking => _manualUploadBooking;
  set manualUploadBooking(dynamic _value) {
    _manualUploadBooking = _value;
  }

  List<dynamic> _expenseCategoryList = [
    jsonDecode('{\"name\":\"Hotel\",\"image\":\"Booking-Hotel.png\"}'),
    jsonDecode('{\"name\":\"Flight\",\"image\":\"Booking-Flight.png\"}'),
    jsonDecode('{\"name\":\"Car Rental\",\"image\":\"Booking-Transport.png\"}'),
    jsonDecode('{\"name\":\"Ticket\",\"image\":\"Booking-Concert.png\"}'),
    jsonDecode(
        '{\"name\":\"Public transit\",\"image\":\"Booking-Activities.png\"}'),
    jsonDecode('{\"name\":\"Food\",\"image\":\"E-Food 2.png\"}'),
    jsonDecode('{\"name\":\"Drink\",\"image\":\"Booking-Activities.png\"}'),
    jsonDecode(
        '{\"name\":\"Gas station\",\"image\":\"Booking-Activities.png\"}'),
    jsonDecode(
        '{\"name\":\"Attraction\",\"image\":\"Booking-Activities.png\"}'),
    jsonDecode('{\"name\":\"Landmark\",\"image\":\"Booking-Activities.png\"}'),
    jsonDecode('{\"name\":\"Other\",\"image\":\"Booking-Activities.png\"}')
  ];
  List<dynamic> get expenseCategoryList => _expenseCategoryList;
  set expenseCategoryList(List<dynamic> _value) {
    _expenseCategoryList = _value;
  }

  void addToExpenseCategoryList(dynamic _value) {
    _expenseCategoryList.add(_value);
  }

  void removeFromExpenseCategoryList(dynamic _value) {
    _expenseCategoryList.remove(_value);
  }

  void removeAtIndexFromExpenseCategoryList(int _index) {
    _expenseCategoryList.removeAt(_index);
  }

  void updateExpenseCategoryListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _expenseCategoryList[_index] = updateFn(_expenseCategoryList[_index]);
  }

  void insertAtIndexInExpenseCategoryList(int _index, dynamic _value) {
    _expenseCategoryList.insert(_index, _value);
  }

  List<dynamic> _bookingCategoryList = [
    jsonDecode('{\"name\":\"Hotel\",\"image\":\"Booking-Hotel.png\"}'),
    jsonDecode('{\"name\":\"Flight\",\"image\":\"Booking-Flight.png\"}'),
    jsonDecode(
        '{\"name\":\"Transportation\",\"image\":\"Booking-Transport.png\"}'),
    jsonDecode('{\"name\":\"Concert\",\"image\":\"Booking-Concert.png\"}'),
    jsonDecode('{\"name\":\"Activity\",\"image\":\"Booking-Activities.png\"}')
  ];
  List<dynamic> get bookingCategoryList => _bookingCategoryList;
  set bookingCategoryList(List<dynamic> _value) {
    _bookingCategoryList = _value;
  }

  void addToBookingCategoryList(dynamic _value) {
    _bookingCategoryList.add(_value);
  }

  void removeFromBookingCategoryList(dynamic _value) {
    _bookingCategoryList.remove(_value);
  }

  void removeAtIndexFromBookingCategoryList(int _index) {
    _bookingCategoryList.removeAt(_index);
  }

  void updateBookingCategoryListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _bookingCategoryList[_index] = updateFn(_bookingCategoryList[_index]);
  }

  void insertAtIndexInBookingCategoryList(int _index, dynamic _value) {
    _bookingCategoryList.insert(_index, _value);
  }

  List<dynamic> _transportationCategoryList = [
    jsonDecode('{\"name\":\"Walk\",\"image\":\"Transport-bike.png\"}'),
    jsonDecode('{\"name\":\"Car\",\"image\":\"Transport-car.png\"}'),
    jsonDecode('{\"name\":\"Bus\",\"image\":\"Transport-bus.png\"}'),
    jsonDecode('{\"name\":\"Rail\",\"image\":\"Transport-train.png\"}'),
    jsonDecode('{\"name\":\"Airplane\",\"image\":\"Transport-airplan.png\"}'),
    jsonDecode('{\"name\":\"Boat\",\"image\":\"Transport-boat.png\"}')
  ];
  List<dynamic> get transportationCategoryList => _transportationCategoryList;
  set transportationCategoryList(List<dynamic> _value) {
    _transportationCategoryList = _value;
  }

  void addToTransportationCategoryList(dynamic _value) {
    _transportationCategoryList.add(_value);
  }

  void removeFromTransportationCategoryList(dynamic _value) {
    _transportationCategoryList.remove(_value);
  }

  void removeAtIndexFromTransportationCategoryList(int _index) {
    _transportationCategoryList.removeAt(_index);
  }

  void updateTransportationCategoryListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _transportationCategoryList[_index] =
        updateFn(_transportationCategoryList[_index]);
  }

  void insertAtIndexInTransportationCategoryList(int _index, dynamic _value) {
    _transportationCategoryList.insert(_index, _value);
  }

  bool _isUploading = true;
  bool get isUploading => _isUploading;
  set isUploading(bool _value) {
    _isUploading = _value;
  }

  List<dynamic> _homeOfflineDataList = [];
  List<dynamic> get homeOfflineDataList => _homeOfflineDataList;
  set homeOfflineDataList(List<dynamic> _value) {
    _homeOfflineDataList = _value;
    prefs.setStringList(
        'ff_homeOfflineDataList', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToHomeOfflineDataList(dynamic _value) {
    _homeOfflineDataList.add(_value);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromHomeOfflineDataList(dynamic _value) {
    _homeOfflineDataList.remove(_value);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromHomeOfflineDataList(int _index) {
    _homeOfflineDataList.removeAt(_index);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  void updateHomeOfflineDataListAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _homeOfflineDataList[_index] = updateFn(_homeOfflineDataList[_index]);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInHomeOfflineDataList(int _index, dynamic _value) {
    _homeOfflineDataList.insert(_index, _value);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _tripOfflineDetail = [];
  List<dynamic> get tripOfflineDetail => _tripOfflineDetail;
  set tripOfflineDetail(List<dynamic> _value) {
    _tripOfflineDetail = _value;
    prefs.setStringList(
        'ff_tripOfflineDetail', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToTripOfflineDetail(dynamic _value) {
    _tripOfflineDetail.add(_value);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTripOfflineDetail(dynamic _value) {
    _tripOfflineDetail.remove(_value);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTripOfflineDetail(int _index) {
    _tripOfflineDetail.removeAt(_index);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  void updateTripOfflineDetailAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _tripOfflineDetail[_index] = updateFn(_tripOfflineDetail[_index]);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTripOfflineDetail(int _index, dynamic _value) {
    _tripOfflineDetail.insert(_index, _value);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  bool _isCallComing = false;
  bool get isCallComing => _isCallComing;
  set isCallComing(bool _value) {
    _isCallComing = _value;
  }

  DocumentReference? _callerUserRef;
  DocumentReference? get callerUserRef => _callerUserRef;
  set callerUserRef(DocumentReference? _value) {
    _callerUserRef = _value;
  }

  String _callRoomPath = '';
  String get callRoomPath => _callRoomPath;
  set callRoomPath(String _value) {
    _callRoomPath = _value;
  }

  bool _isHangUp = false;
  bool get isHangUp => _isHangUp;
  set isHangUp(bool _value) {
    _isHangUp = _value;
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
