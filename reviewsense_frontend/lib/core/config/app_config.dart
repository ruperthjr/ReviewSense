abstract final class AppConfig {
  factory AppConfig.dev() = _DevConfig;
  factory AppConfig.prod() = _ProdConfig;

  String get baseUrl;
  String get environment;
}

final class _DevConfig implements AppConfig {
  const _DevConfig();

  @override
  String get baseUrl => 'https://dev.api.reviewsense.com/v1';

  @override
  String get environment => 'dev';
}

final class _ProdConfig implements AppConfig {
  const _ProdConfig();

  @override
  String get baseUrl => 'https://api.reviewsense.com/v1';

  @override
  String get environment => 'prod';
}