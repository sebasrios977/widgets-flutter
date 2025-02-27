import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final isDarkModeProvider = StateProvider<bool>((ref) => false);

// Listado de colores inmutables
final colorListProvider = Provider((ref) => colorList);

final selectedColorProvider = StateProvider<int>((ref) => 0);

// Objeto de tipo AppTheme (custom)

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier()
);


// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {

  // STATE = Estado = new AppTheme()
  ThemeNotifier(): super(AppTheme());


  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int index) {
    state = state.copyWith(selectedColor: index);
  }

}
