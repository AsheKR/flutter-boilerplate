import 'dart:async';
import 'dart:developer';

import 'package:base/app/app.dart';
import 'package:base/dependency/datasource.dart';
import 'package:base/environment/config/config.dart';
import 'package:base/util/localization.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> bootstrap({
  required Future<DataSourceDependency> Function() getDataSourceDependency,
  required EnvironmentEnum environmentEnum,
}) async {
  FlutterError.onError = (details) {
    Sentry.captureException(details.exception, stackTrace: details.stack);
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    final dataSourceDependency = await getDataSourceDependency();
    final configDataSource = await dataSourceDependency.getConfigDataSource();
    final deviceDataSource = await dataSourceDependency.getDeviceDataSource();
    final packageDataSource = await dataSourceDependency.getPackageDataSource();

    final manufacturer = await deviceDataSource.getManufacturer();
    final model = await deviceDataSource.getModel();
    final osName = await deviceDataSource.getOSName();
    final osVersion = await deviceDataSource.getOSVersion();
    final appVersion = await packageDataSource.getVersion();

    Sentry.configureScope((scope) async {
      scope.setTag('manufacturer', manufacturer);
      scope.setTag('model', model);
      scope.setTag('osName', osName);
      scope.setTag('osVersion', osVersion);
      scope.setTag('appVersion', appVersion);
    });

    await SentryFlutter.init(
      (options) {
        options.dsn = EnvironmentConfig.sentryDSN;
        options.environment = environmentEnum.name;
      },
    );

    runApp(
      EasyLocalization(
        supportedLocales: SupportLocale.values
            .map((element) => Locale(element.name))
            .toList(),
        fallbackLocale: Locale(SupportLocale.en.name),
        useOnlyLangCode: true,
        path: 'asset/translation',
        child: App(
          onLocaleResolutionCallback: (locale, supportedLocale) {
            Sentry.configureScope((scope) async {
              scope.setTag('acceptLanguage', locale?.languageCode ?? '');
            });
            return locale;
          },
        ),
      ),
    );
  }, (error, stack) {
    // Catch plugin error
    Sentry.captureException(error, stackTrace: stack);
    log(error.toString(), stackTrace: stack);
  });
}
