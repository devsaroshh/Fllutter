import 'package:shared_preferences/shared_preferences.dart';
import 'package:stopwatch/core/resources/strings.dart';

class AppLocalStorage {
  AppLocalStorage(this._prefs);
  final SharedPreferences _prefs;

  Future<void> storeThemeString(String value) async {
    await _prefs.setString(Strings.themes, value);
  }

  String readThemeString() {
    return _prefs.getString(Strings.themes) ?? Strings.dark.toLowerCase();
  }
}
