import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static void init() async {
    await GetStorage.init();
  }

  static final GetStorage storageBox = GetStorage();

  static int? readInt(String key) {
    return storageBox.read<int>(key);
  }

  static bool? readBool(String key) {
    return storageBox.read<bool>(key);
  }

  static String? readString(String key) {
    return storageBox.read<String>(key);
  }

  static dynamic read(String key) async {
    return await storageBox.read(key);
  }

  static writeInt(String key, int value) async {
    await storageBox.write(key, value);
  }

  static writeBool(String key, bool value) async {
    await storageBox.write(key, value);
  }

  static writeString(String key, String value) async {
    await storageBox.write(key, value);
  }

  static write(String key, dynamic value) async {
    await storageBox.write(key, value);
  }

  static writeIfNull(String key, dynamic value) async {
    await storageBox.writeIfNull(key, value);
  }

  static remove(String key) async {
    await storageBox.remove(key);
  }
}
