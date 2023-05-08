import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _temporaryMessage = '';
  String get temporaryMessage => _temporaryMessage;
  set temporaryMessage(String _value) {
    _temporaryMessage = _value;
  }

  DocumentReference? _singleUser;
  DocumentReference? get singleUser => _singleUser;
  set singleUser(DocumentReference? _value) {
    _singleUser = _value;
  }

  List<DocumentReference> _multipleUsers = [];
  List<DocumentReference> get multipleUsers => _multipleUsers;
  set multipleUsers(List<DocumentReference> _value) {
    _multipleUsers = _value;
  }

  void addToMultipleUsers(DocumentReference _value) {
    _multipleUsers.add(_value);
  }

  void removeFromMultipleUsers(DocumentReference _value) {
    _multipleUsers.remove(_value);
  }

  void removeAtIndexFromMultipleUsers(int _index) {
    _multipleUsers.removeAt(_index);
  }

  List<String> _testList = ['test1', 'test2', 'test3'];
  List<String> get testList => _testList;
  set testList(List<String> _value) {
    _testList = _value;
  }

  void addToTestList(String _value) {
    _testList.add(_value);
  }

  void removeFromTestList(String _value) {
    _testList.remove(_value);
  }

  void removeAtIndexFromTestList(int _index) {
    _testList.removeAt(_index);
  }

  List<String> _photoTestList = [
    'https://picsum.photos/seed/607/600',
    'https://picsum.photos/seed/125/600',
    'https://picsum.photos/seed/560/600'
  ];
  List<String> get photoTestList => _photoTestList;
  set photoTestList(List<String> _value) {
    _photoTestList = _value;
  }

  void addToPhotoTestList(String _value) {
    _photoTestList.add(_value);
  }

  void removeFromPhotoTestList(String _value) {
    _photoTestList.remove(_value);
  }

  void removeAtIndexFromPhotoTestList(int _index) {
    _photoTestList.removeAt(_index);
  }

  bool _isFullData = true;
  bool get isFullData => _isFullData;
  set isFullData(bool _value) {
    _isFullData = _value;
  }

  String _roomID = '';
  String get roomID => _roomID;
  set roomID(String _value) {
    _roomID = _value;
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
