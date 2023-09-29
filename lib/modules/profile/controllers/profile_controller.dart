import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grooce/routes/app_routes.dart';
import 'package:grooce/utils/constants/storage_consts.dart';
import 'package:grooce/utils/extensions/string_extension.dart';
import '../../../data/config/logger.dart';
import '../../../data/providers/user_provider.dart';
import '../../../data/services/firebase_auth_service.dart';
import '../../../data/theme/theme_controller.dart';

class ProfileController extends GetxController {
  final ThemeController _themeController = Get.find<ThemeController>();
  RxBool isBtnLoading = false.obs;

  RxString selectedTheme = ''.obs;

  @override
  void onInit() async {
    switch (_themeController.currentTheme) {
      case ThemeMode.system:
        selectedTheme(StorageConsts.system);
        break;

      case ThemeMode.dark:
        selectedTheme(StorageConsts.dark);
        break;

      case ThemeMode.light:
        selectedTheme(StorageConsts.light);
        break;
    }
    super.onInit();
  }

  void onOk() {
    logI(selectedTheme);
    logI(selectedTheme().toThemeMode());
    _themeController.changeTheme(selectedTheme().toThemeMode());
    Get.back();
  }

  Future<void> onLogOut() async {
    isBtnLoading(true);
    try {
      await FireAuthService.signOutFromApp();
      await UserProviderController.onLogout();
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      logE(e);
    } finally {
      isBtnLoading(false);
    }
  }
}
