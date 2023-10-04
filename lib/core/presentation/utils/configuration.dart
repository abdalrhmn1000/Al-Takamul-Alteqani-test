import 'package:injectable/injectable.dart';
import 'package:al_takamul_alteqani_test/core/data/utils/app_environment.dart';
import 'package:al_takamul_alteqani_test/core/data/utils/configuration.dart';

@LazySingleton(as: Configuration, env: [AppEnvironment.dev])
class DevConfiguration implements Configuration {
  @override
  String get getBaseUrl =>
      'https://api.stackexchange.com/2.3';

  @override
  String get name => 'development';
  @override
  String get getAppUrl => '$getBaseUrl/';
}

@LazySingleton(as: Configuration, env: [AppEnvironment.staging])
class StagingConfiguration implements Configuration {
  @override
  String get getBaseUrl =>
      'https://api.stackexchange.com/2.3';

  @override
  String get name => 'staging';

  @override
  String get getAppUrl => '$getBaseUrl/';
}

@LazySingleton(as: Configuration, env: [AppEnvironment.prod])
class ProdConfiguration implements Configuration {
  @override
  String get getBaseUrl =>
      'https://api.stackexchange.com/2.3';

  @override
  String get name => 'production';

  @override
  String get getAppUrl => '$getBaseUrl/';
}
