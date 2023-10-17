import 'package:base/app/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    LocaleResolutionCallback? onLocaleResolutionCallback,
  }) : _onLocaleResolutionCallback = onLocaleResolutionCallback;

  final LocaleResolutionCallback? _onLocaleResolutionCallback;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localeResolutionCallback: (locale, supportedLocales) {
        return _onLocaleResolutionCallback?.call(locale, supportedLocales);
      },
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
    );
  }
}
