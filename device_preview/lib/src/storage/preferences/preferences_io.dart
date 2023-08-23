import 'dart:convert';

import 'package:device_preview/src/state/state.dart';
import 'package:get_storage/get_storage.dart';
import '../storage.dart';

/// A storage that keeps all preferences stored as json in the
/// preference entry with the [preferenceKey] key.
class PreferencesDevicePreviewStorage extends DevicePreviewStorage {
  PreferencesDevicePreviewStorage({
    this.preferenceKey = defaultPreferencesKey,
  });

  /// The preferences key used to save the user configuration.
  final String preferenceKey;

  /// The default preferences key used to save the user configuration.
  static const String defaultPreferencesKey = 'device_preview.settings';

  /// Load the last saved preferences (until [ignore] is `true`).
  @override
  Future<DevicePreviewData?> load() async {
    await GetStorage.init();
    final box = GetStorage();
    // final shared = await SharedPreferences.getInstance();
    final json = box.read(preferenceKey);
    if (json == null || json.isEmpty) return null;
    return DevicePreviewData.fromJson(jsonDecode(json));
  }

  /// Save the current preferences (until [ignore] is `true`).
  @override
  Future<void> save(DevicePreviewData data) async {
    _saveData = data;
    _saveTask ??= _save();
    await _saveTask;
  }

  Future<void>? _saveTask;
  DevicePreviewData? _saveData;

  Future _save() async {
    await GetStorage.init(); 
    if (_saveData != null) {
      final box = GetStorage();
      await box.write(preferenceKey, jsonEncode(_saveData!.toJson()));
    }
    _saveTask = null;
  }
}
