import 'package:equatable/equatable.dart';

abstract class AppException extends Equatable implements Exception {
  final String code;
  final String message;
  final dynamic data;

  const AppException({required this.code, required this.message, this.data});

  @override
  List<Object> get props => [code, message];
}

class DefaultAppException extends AppException {
  const DefaultAppException({
    String message = '',
    String code = 'DEFAULT_APP_EXCEPTION',
    dynamic data,
  }) : super(
          message: message,
          code: code,
          data: data,
        );
}

class InternetConnectionException extends AppException {
  const InternetConnectionException({
    String message = '',
    String code = 'INTERNET_CONNECTION_EXCEPTION',
  }) : super(message: message, code: code);
}
