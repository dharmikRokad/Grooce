import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grooce/utils/constants/storage_consts.dart';
import 'package:grooce/utils/extensions/theme_mode_extension.dart';
import '../helpers/storage_helper.dart';

class ThemeController extends GetxController {
  final Rx<ThemeMode> _currentTheme = ThemeMode.light.obs;

  ThemeMode get currentTheme => _currentTheme();

  @override
  void onInit() {
    super.onInit();
    _initializeTheme();
  }

  void _initializeTheme() {
    String savedTheme = StorageHelper.readString(StorageConsts.theme) ??
        ThemeMode.light.inToString();
    _currentTheme(
      ThemeMode.values.firstWhere((theme) => theme.inToString() == savedTheme),
    );
  }

  void changeTheme(ThemeMode newMode) {
    _currentTheme(newMode);
    StorageHelper.write(StorageConsts.theme, _currentTheme().inToString());
    _updateThemeMode();
  }

  void _updateThemeMode() {
    Get.changeThemeMode(currentTheme);
  }
}
