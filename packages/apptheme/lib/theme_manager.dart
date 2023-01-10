part of apptheme;

/// Manages all theme changes in the app. Implemented using provider.
class ThemeManager extends ChangeNotifier {
  static const String savedTheme = 'theme';
  bool isDark = true;

  ///Toggle, to change the theme of the app from light to dark.
  changeTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = !isDark;
    await prefs.setBool(savedTheme, isDark);
    notifyListeners();
  }

  ///Loads the theme, set by the user while closing the app.
  initializeTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool(savedTheme) ?? true;
    notifyListeners();
  }

  ///Gets the theme of the app.
  getTheme() {
    if (isDark == true) {
      return AppThemeData.dark();
    } else {
      return AppThemeData.light();
    }
  }
}
