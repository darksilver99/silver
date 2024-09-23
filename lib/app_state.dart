import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import 'backend/api_requests/api_manager.dart';
import '/backend/sqlite/sqlite_manager.dart';
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
  set monthList(List<dynamic> value) {
    _monthList = value;
    prefs.setStringList(
        'ff_monthList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToMonthList(dynamic value) {
    monthList.add(value);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMonthList(dynamic value) {
    monthList.remove(value);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMonthList(int index) {
    monthList.removeAt(index);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }

  void updateMonthListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    monthList[index] = updateFn(_monthList[index]);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInMonthList(int index, dynamic value) {
    monthList.insert(index, value);
    prefs.setStringList(
        'ff_monthList', _monthList.map((x) => jsonEncode(x)).toList());
  }

  dynamic _userData;
  dynamic get userData => _userData;
  set userData(dynamic value) {
    _userData = value;
    prefs.setString('ff_userData', jsonEncode(value));
  }

  List<dynamic> _tripCreatedMapList = [];
  List<dynamic> get tripCreatedMapList => _tripCreatedMapList;
  set tripCreatedMapList(List<dynamic> value) {
    _tripCreatedMapList = value;
    prefs.setStringList(
        'ff_tripCreatedMapList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTripCreatedMapList(dynamic value) {
    tripCreatedMapList.add(value);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTripCreatedMapList(dynamic value) {
    tripCreatedMapList.remove(value);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTripCreatedMapList(int index) {
    tripCreatedMapList.removeAt(index);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  void updateTripCreatedMapListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    tripCreatedMapList[index] = updateFn(_tripCreatedMapList[index]);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTripCreatedMapList(int index, dynamic value) {
    tripCreatedMapList.insert(index, value);
    prefs.setStringList('ff_tripCreatedMapList',
        _tripCreatedMapList.map((x) => jsonEncode(x)).toList());
  }

  dynamic _tripCreatedMapData;
  dynamic get tripCreatedMapData => _tripCreatedMapData;
  set tripCreatedMapData(dynamic value) {
    _tripCreatedMapData = value;
  }

  dynamic _selectedLocationPlace;
  dynamic get selectedLocationPlace => _selectedLocationPlace;
  set selectedLocationPlace(dynamic value) {
    _selectedLocationPlace = value;
  }

  dynamic _manualUploadBooking;
  dynamic get manualUploadBooking => _manualUploadBooking;
  set manualUploadBooking(dynamic value) {
    _manualUploadBooking = value;
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
  set expenseCategoryList(List<dynamic> value) {
    _expenseCategoryList = value;
  }

  void addToExpenseCategoryList(dynamic value) {
    expenseCategoryList.add(value);
  }

  void removeFromExpenseCategoryList(dynamic value) {
    expenseCategoryList.remove(value);
  }

  void removeAtIndexFromExpenseCategoryList(int index) {
    expenseCategoryList.removeAt(index);
  }

  void updateExpenseCategoryListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    expenseCategoryList[index] = updateFn(_expenseCategoryList[index]);
  }

  void insertAtIndexInExpenseCategoryList(int index, dynamic value) {
    expenseCategoryList.insert(index, value);
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
  set bookingCategoryList(List<dynamic> value) {
    _bookingCategoryList = value;
  }

  void addToBookingCategoryList(dynamic value) {
    bookingCategoryList.add(value);
  }

  void removeFromBookingCategoryList(dynamic value) {
    bookingCategoryList.remove(value);
  }

  void removeAtIndexFromBookingCategoryList(int index) {
    bookingCategoryList.removeAt(index);
  }

  void updateBookingCategoryListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    bookingCategoryList[index] = updateFn(_bookingCategoryList[index]);
  }

  void insertAtIndexInBookingCategoryList(int index, dynamic value) {
    bookingCategoryList.insert(index, value);
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
  set transportationCategoryList(List<dynamic> value) {
    _transportationCategoryList = value;
  }

  void addToTransportationCategoryList(dynamic value) {
    transportationCategoryList.add(value);
  }

  void removeFromTransportationCategoryList(dynamic value) {
    transportationCategoryList.remove(value);
  }

  void removeAtIndexFromTransportationCategoryList(int index) {
    transportationCategoryList.removeAt(index);
  }

  void updateTransportationCategoryListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    transportationCategoryList[index] =
        updateFn(_transportationCategoryList[index]);
  }

  void insertAtIndexInTransportationCategoryList(int index, dynamic value) {
    transportationCategoryList.insert(index, value);
  }

  bool _isUploading = true;
  bool get isUploading => _isUploading;
  set isUploading(bool value) {
    _isUploading = value;
  }

  List<dynamic> _homeOfflineDataList = [];
  List<dynamic> get homeOfflineDataList => _homeOfflineDataList;
  set homeOfflineDataList(List<dynamic> value) {
    _homeOfflineDataList = value;
    prefs.setStringList(
        'ff_homeOfflineDataList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToHomeOfflineDataList(dynamic value) {
    homeOfflineDataList.add(value);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromHomeOfflineDataList(dynamic value) {
    homeOfflineDataList.remove(value);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromHomeOfflineDataList(int index) {
    homeOfflineDataList.removeAt(index);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  void updateHomeOfflineDataListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    homeOfflineDataList[index] = updateFn(_homeOfflineDataList[index]);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInHomeOfflineDataList(int index, dynamic value) {
    homeOfflineDataList.insert(index, value);
    prefs.setStringList('ff_homeOfflineDataList',
        _homeOfflineDataList.map((x) => jsonEncode(x)).toList());
  }

  List<dynamic> _tripOfflineDetail = [];
  List<dynamic> get tripOfflineDetail => _tripOfflineDetail;
  set tripOfflineDetail(List<dynamic> value) {
    _tripOfflineDetail = value;
    prefs.setStringList(
        'ff_tripOfflineDetail', value.map((x) => jsonEncode(x)).toList());
  }

  void addToTripOfflineDetail(dynamic value) {
    tripOfflineDetail.add(value);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTripOfflineDetail(dynamic value) {
    tripOfflineDetail.remove(value);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTripOfflineDetail(int index) {
    tripOfflineDetail.removeAt(index);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  void updateTripOfflineDetailAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    tripOfflineDetail[index] = updateFn(_tripOfflineDetail[index]);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTripOfflineDetail(int index, dynamic value) {
    tripOfflineDetail.insert(index, value);
    prefs.setStringList('ff_tripOfflineDetail',
        _tripOfflineDetail.map((x) => jsonEncode(x)).toList());
  }

  bool _isCallComing = false;
  bool get isCallComing => _isCallComing;
  set isCallComing(bool value) {
    _isCallComing = value;
  }

  DocumentReference? _callerUserRef;
  DocumentReference? get callerUserRef => _callerUserRef;
  set callerUserRef(DocumentReference? value) {
    _callerUserRef = value;
  }

  String _callRoomPath = '';
  String get callRoomPath => _callRoomPath;
  set callRoomPath(String value) {
    _callRoomPath = value;
  }

  String _htmlContent = '';
  String get htmlContent => _htmlContent;
  set htmlContent(String value) {
    _htmlContent = value;
  }

  bool _testPersitence = false;
  bool get testPersitence => _testPersitence;
  set testPersitence(bool value) {
    _testPersitence = value;
  }
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
