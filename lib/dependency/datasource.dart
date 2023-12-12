import 'dart:io';

import 'package:base/datasource/config.dart';
import 'package:base/service/device.dart';
import 'package:base/service/package.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DataSourceDependency {
  DataSourceDependency({
    required DeviceInfoPlugin deviceInfoPlugin,
    required PackageInfo packageInfo,
    required SharedPreferences sharedPreferences,
  })  : _deviceInfoPlugin = deviceInfoPlugin,
        _packageInfo = packageInfo,
        _sharedPreferences = sharedPreferences;

  final DeviceInfoPlugin _deviceInfoPlugin;
  final PackageInfo _packageInfo;
  final SharedPreferences _sharedPreferences;

  Future<ConfigDataSource> getConfigDataSource() async {
    return ConfigDataSource(sharedPreferences: _sharedPreferences);
  }

  Future<DeviceService> getDeviceDataSource() async {
    if (kIsWeb) {
      final webBrowserInfo = await _deviceInfoPlugin.webBrowserInfo;
      return WebDeviceService(deviceInfo: webBrowserInfo);
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
      return AndroidDeviceService(deviceInfo: androidDeviceInfo);
    } else if (Platform.isIOS) {
      final iOSDeviceInfo = await _deviceInfoPlugin.iosInfo;
      return IOSDeviceService(deviceInfo: iOSDeviceInfo);
    } else {
      return UnknownDeviceService();
    }
  }

  Future<PackageService> getPackageDataSource() async {
    return PackageService(packageInfo: _packageInfo);
  }
}
