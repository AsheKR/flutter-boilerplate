enum EnvironmentEnum {
  development,
  production,
}


class EnvironmentConfig {
  static const String sentryDSN = String.fromEnvironment('SENTRY_DSN', defaultValue: '');
}
