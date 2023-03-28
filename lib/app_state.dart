import 'package:flutter/material.dart';
import 'backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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
