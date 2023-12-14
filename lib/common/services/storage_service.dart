import 'package:shared_preferences/shared_preferences.dart';
import '../values/constants.dart';

class StorageService{
  late final SharedPreferences _preferences;

  /// Singleton - pass only one instance
  Future<StorageService> init() async{
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async{
    return await _preferences.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async{
    return await _preferences.setString(key, value);
  }

  bool getDeviceFirstOpen(){
    /// if null, return false, else return true
    return _preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME)==null?false:true;
  }

  bool getIsLoggedIn(){
    /// if null, return false, else return true
    return _preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY)==null?false:true;
  }

  Future<bool> remove(String key){
    return _preferences.remove(key);
  }

  String getUserToken(){
    /// if null, return ""
    return _preferences.getString(AppConstants.STORAGE_USER_TOKEN_KEY)??"";
  }
}