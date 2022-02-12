import 'package:shared_preferences/shared_preferences.dart';

class HiCache {
  SharedPreferences? _preferences;
  HiCache._() {
    init();
  }

  static HiCache? _instance;
  static HiCache getInstance() {
    if (_instance == null) {
      _instance = HiCache._();
    }
    return _instance!;
  }

  void init() async {
    if (_preferences == null) {
      _preferences = await SharedPreferences.getInstance();
    }
  }

  static Future<HiCache> preInit() async {
    if (_instance == null) {
      var perfs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(perfs);
    }
    return _instance!;
  }

  HiCache._pre(SharedPreferences perfs) {
    _preferences = perfs;
  }

  setString(String key, String value) {
    _preferences?.setString(key, value);
  }

  setDouble(String key, double value) {
    _preferences?.setDouble(key, value);
  }

  setInt(String key, int value) {
    _preferences?.setInt(key, value);
  }

  setBool(String key, bool value) {
    _preferences?.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    _preferences?.setStringList(key, value);
  }

  T get<T>(String key) {
    return _preferences!.get(key) as T;
  }
}
