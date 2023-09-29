import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grooce/ui/app_button.dart';
import 'package:grooce/utils/constants/text_styles.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              _showThemeDialog(context);
            },
            title: Text(
              'Theme',
              style: kSemiBold16,
            ),
            trailing: Obx(
              () => Text(
                controller.selectedTheme(),
                style: kSemiBold14,
              ),
            ),
          ),
          const Spacer(),
          AppButton(
            text: 'Log out',
            onPressed: controller.onLogOut,
            isLoading: controller.isBtnLoading(),
            type: AppButtonWidthType.full,
            colorType: AppButtonColorType.primary,
          )
        ],
      ).paddingAll(20.r),
    );
  }

  _showThemeDialog(BuildContext context) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => _buildDialog(),
      );

  _buildDialog() => AlertDialog(
        title: const Text('Select a Theme'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRadioTile('light', 'Light'),
            _buildRadioTile('dark', 'Dark'),
            _buildRadioTile('system', 'System'),
          ],
        ),
        actions: [
          TextButton(onPressed: controller.onOk, child: const Text('Ok')),
        ],
      );

  _buildRadioTile(String value, String title) => Obx(
        () => RadioListTile(
          value: value,
          groupValue: controller.selectedTheme(),
          onChanged: (value) {
            controller.selectedTheme(value.toString());
          },
          title: Text(title),
        ),
      );
}
