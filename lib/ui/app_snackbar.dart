import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// State of the snackbar
/// Setting this will set the background color of the snackbar
enum SnackbarState {
  /// For Information message
  info,

  /// For Warning message
  warning,

  /// For Danger message
  danger,

  /// For Success message
  success,

  /// Default state of the message
  defaultState,
}

/// App themed snackbar
void appSnackbar({
  required String message,
  SnackbarState snackbarState = SnackbarState.defaultState,
}) {
  Get.rawSnackbar(
    icon: Icon(
      _snackbarIcon(snackbarState),
      color: Colors.white,
    ),
    margin: const EdgeInsets.all(8),
    messageText: Text(
      message,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: _snackbarColor(snackbarState),
    borderRadius: 10,
    duration: const Duration(seconds: 2),
  );
}

Color _snackbarColor(SnackbarState snackbarState) {
  switch (snackbarState) {
    case SnackbarState.info:
      return Colors.blue;
    case SnackbarState.warning:
      return Colors.orangeAccent;
    case SnackbarState.danger:
      return Colors.red;
    case SnackbarState.defaultState:
      return Colors.blueGrey;
    case SnackbarState.success:
      return Theme.of(Get.context!).colorScheme.primary;
    default:
      return Colors.black;
  }
}

IconData _snackbarIcon(SnackbarState snackbarState) {
  switch (snackbarState) {
    case SnackbarState.info:
      return CupertinoIcons.info_circle_fill;
    case SnackbarState.warning:
      return CupertinoIcons.exclamationmark_triangle_fill;
    case SnackbarState.danger:
      return CupertinoIcons.exclamationmark_circle_fill;
    case SnackbarState.defaultState:
      return CupertinoIcons.bell_fill;
    case SnackbarState.success:
      return CupertinoIcons.checkmark_circle_fill;
    default:
      return CupertinoIcons.bell_fill;
  }
}
