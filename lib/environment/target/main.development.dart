import 'package:base/bootstrap.dart';
import 'package:base/dependency/datasource.dart';
import 'package:base/environment/config/config.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  bootstrap(
    getDataSourceDependency: getDataSourceDependency,
    environmentEnum: EnvironmentEnum.development,
  );
}

Future<DataSourceDependency> getDataSourceDependency() async {
  final deviceInfoPlugin = DeviceInfoPlugin();
  final packageInfo = await PackageInfo.fromPlatform();
  final sharedPreferences = await SharedPreferences.getInstance();
  return DataSourceDependency(
    deviceInfoPlugin: deviceInfoPlugin,
    packageInfo: packageInfo,
    sharedPreferences: sharedPreferences,
  );
}
