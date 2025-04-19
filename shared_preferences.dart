import 'package:shared_preferences/shared_preferences.dart';

class ThemePreference {
  // Key for storing theme preference in SharedPreferences
  static const String _keyIsDarkMode = 'isDarkMode';

  // Save the theme mode to SharedPreferences
  static Future<void> setThemeMode(bool isDarkMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsDarkMode, isDarkMode);
  }

  // Load the theme mode from SharedPreferences
  static Future<bool> getThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Return the saved theme mode, default to false (light mode) if not set
    return prefs.getBool(_keyIsDarkMode) ?? false;
  }
}
