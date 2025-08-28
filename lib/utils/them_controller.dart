import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeController extends GetxController {
  // Observable variable for the theme mode
  final RxBool isDarkMode = false.obs;

  // Key for storing theme preference
  static const String _themeKey = 'THEME_MODE';

  @override
  void onInit() {
    super.onInit();
    _loadThemePreference();
  }

  // Load saved theme preference from SharedPreferences
  Future<void> _loadThemePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool savedDarkMode = prefs.getBool(_themeKey) ?? false;
    isDarkMode.value = savedDarkMode;
    _updateThemeMode();
  }

  // Save theme preference to SharedPreferences
  Future<void> _saveThemePreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDarkMode.value);
  }

  // Toggle between light and dark theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    _saveThemePreference();
    _updateThemeMode();
  }

  // Set specific theme mode
  void setTheme(bool darkMode) {
    if (isDarkMode.value != darkMode) {
      isDarkMode.value = darkMode;
      _saveThemePreference();
      _updateThemeMode();
    }
  }

  // Update GetX theme mode
  void _updateThemeMode() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}