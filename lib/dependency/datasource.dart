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

  Future<DeviceDataSource> getDeviceDataSource() async {
    if (kIsWeb) {
      final webBrowserInfo = await _deviceInfoPlugin.webBrowserInfo;
      return WebDeviceDataSource(deviceInfo: webBrowserInfo);
    } else if (Platform.isAndroid) {
      final androidDeviceInfo = await _deviceInfoPlugin.androidInfo;
      return AndroidDeviceDataSource(deviceInfo: androidDeviceInfo);
    } else if (Platform.isIOS) {
      final iOSDeviceInfo = await _deviceInfoPlugin.iosInfo;
      return IOSDeviceDataSource(deviceInfo: iOSDeviceInfo);
    } else {
      return UnknownDeviceDataSource();
    }
  }

  Future<PackageDataSource> getPackageDataSource() async {
    return PackageDataSource(packageInfo: _packageInfo);
  }
}
