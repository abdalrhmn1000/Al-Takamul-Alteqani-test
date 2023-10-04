import 'package:al_takamul_alteqani_test/core/domain/entities/enums/server_error_code.dart';

abstract class Failure {}

class ServerFailure implements Failure {
  final ServerErrorCode errorCode;
  final String message;

  ServerFailure({required this.errorCode, this.message = ''});
}

class NetworkFailure implements Failure {
  NetworkFailure();
}
