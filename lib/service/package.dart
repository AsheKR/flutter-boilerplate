import 'package:package_info_plus/package_info_plus.dart';

class PackageService {
  PackageService({
    required PackageInfo packageInfo,
  }) : _packageInfo = packageInfo;

  final PackageInfo _packageInfo;

  Future<String> getVersion() async {
    return _packageInfo.version;
  }
}
