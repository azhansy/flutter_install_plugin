import 'dart:async';

import 'package:flutter/services.dart';

class FlutterInstallPlugin {
  static const MethodChannel _channel =
      const MethodChannel('flutter_install_plugin');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  /// for Android : install apk by its file absolute path;
  /// if the target platform is higher than android 24:
  /// a [appId] is required
  /// (the caller's applicationId which is defined in build.gradle)
  static Future<String?> installApk(String filePath, String appId) async {
    Map<String, String> params = {'filePath': filePath, 'appId': appId};
    return await _channel.invokeMethod('installApk', params);
//    if (Platform.isAndroid) {
//
//    }else{
//      return null;
//    }
  }
}
