import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:al_takamul_alteqani_test/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection(String env) async {
  await GetItInjectableX(getIt).init(environment: env);
}
