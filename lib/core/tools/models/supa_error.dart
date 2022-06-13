import 'dart:developer';

enum ErrorTypes {
  /// CUANDO SE TRATA DE UN ERROR CON UN MENSAJE PERSONALIZADO, CÓDIGO DE ERROR QUE REGRESA 400, TIPO "default_error"
  ///
  /// When a error with a personalized message, code error returns 400, type "default_error"
  defaultError,

  /// CUANDO NO ESTA LOGGEADO, CÓDIGO DE ERROR QUE REGRESA 401, TIPO "authentication_error"
  ///
  /// When not logged, code error returns 401, type "authentication_error"
  authenticationError,

  /// CUANDO NO TIENE PERMISOS, CÓDIGO DE ERROR QUE REGRESA 403, TIPO "unauthorized_error"
  ///
  /// When not have permissions, code error returns 403, type "unauthorized_error"
  unauthorizedError,

  /// CUANDO NO SE ENCUENTRA EL REGISTRO O MODELO, CÓDIGO DE ERROR QUE REGRESA 404, TIPO "model_error"
  ///
  /// When not found the record or model, code error returns 404, type "model_error"
  modelError,

  /// CUANDO NO EXISTE LA RUTA, CÓDIGO DE ERROR QUE REGRESA 404, TIPO "not_found_http_error"
  ///
  /// When not found the route, code error returns 404, type "not_found_http_error"
  notFoundHttpError,

  /// CUANDO NO SE ESPCIFICO EL METODO DE LA RUTA, CÓDIGO DE ERROR QUE REGRESA 405, TIPO "method_not_allowed_error"
  ///
  /// When not specified the method of the route, code error returns 405, type "method_not_allowed_error"
  methodNotAllowedError,

  /// CUANDO NO SE PUDO PROCESAR LA CONSULTA CORRECTAMENTE, CÓDIGO DE ERROR QUE REGRESA 409, TIPO "query_error"
  ///
  /// When not process the query correctly, code error returns 409, type "query_error"
  queryError,

  /// CUANDO SE VALIDA UN FORMULARIO, CÓDIGO DE ERROR QUE REGRESA 422, TIPO "validation_error"
  ///Esta usa el [errors] de la clase [Errors].
  ///
  /// When validating a form, code error returns 422, type "validation_error"
  /// This uses the [errors] of the class [Errors].
  validationError,

  /// CUANDO SE EJECUTAN MUCHAS PETICIONES DE GOLPE, CÓDIGO DE ERROR QUE REGRESA 429, TIPO "throttle_requests_error"
  ///
  /// When many requests are executed, code error returns 429, type "throttle_requests_error"
  throttleRequestsError,

  /// CUANDO SE TRATE DE OTRO ERROR QUE NO SON LOS ANTERIORES, CÓDIGO DE ERROR QUE REGRESA 500, TIPO "internal_server_error"
  ///
  /// When other error that are not the previous, code error returns 500, type "internal_server_error"
  internalServerError,

  /// CUANDO SE TRATE DE OTRO ERROR QUE NO SON LOS ANTERIORES, CÓDIGO DE ERROR QUE REGRESA 666, TIPO "devils_error"
  ///
  /// When other error that are not the previous, code error returns 666, type "devils_error"
  devilsError;

  static ErrorTypes errorTypeParser(String errorType) {
    switch (errorType) {
      case 'default_error':
        return ErrorTypes.defaultError;
      case 'authentication_error':
        return ErrorTypes.authenticationError;
      case 'unauthorized_error':
        return ErrorTypes.unauthorizedError;
      case 'model_error':
        return ErrorTypes.modelError;
      case 'not_found_http_error':
        return ErrorTypes.notFoundHttpError;
      case 'method_not_allowed_error':
        return ErrorTypes.methodNotAllowedError;
      case 'query_error':
        return ErrorTypes.queryError;
      case 'validation_error':
        return ErrorTypes.validationError;
      case 'throttle_requests_error':
        return ErrorTypes.throttleRequestsError;
      case 'internal_server_error':
        return ErrorTypes.internalServerError;
      default:
        return ErrorTypes.devilsError;
    }
  }

  @override
  String toString() {
    switch (this) {
      case ErrorTypes.defaultError:
        return "defaultError";
      case ErrorTypes.authenticationError:
        return "authenticationError";
      case ErrorTypes.unauthorizedError:
        return "unauthorizedError";
      case ErrorTypes.modelError:
        return "modelError";
      case ErrorTypes.notFoundHttpError:
        return "notFoundHttpError";
      case ErrorTypes.methodNotAllowedError:
        return "methodNotAllowedError";
      case ErrorTypes.queryError:
        return "queryError";
      case ErrorTypes.validationError:
        return "validationError";
      case ErrorTypes.throttleRequestsError:
        return "throttleRequestsError";
      case ErrorTypes.internalServerError:
        return "internalServerError";
      case ErrorTypes.devilsError:
        return "devilsError";
    }
  }
}

class SupaError {
  String code;
  ErrorTypes errorType;
  String? message;
  Errors? errors;
  void Function(ErrorTypes)? onError;

  ///Manage the errors of the request.
  ///
  ///It log the [ErrorTypes] and [message] in the console.
  ///Also can call a [Function] to manage the error.
  SupaError(
      {required this.code,
      required this.errorType,
      this.message,
      this.errors,
      this.onError}) {
    log(errorType.toString().toUpperCase(),
        error: toString(), name: 'SupaError');
    onError?.call(errorType);
  }

  static SupaError fromJson(Map<String, dynamic> json,
      {void Function(ErrorTypes)? onError}) {
    final type = ErrorTypes.errorTypeParser(json['type']);
    return SupaError(
      code: json['code'].toString(),
      errorType: type,
      message: type == ErrorTypes.validationError ? null : json['body'],
      errors: type == ErrorTypes.validationError
          ? Errors.fromJson(json['body'])
          : null,
      onError: onError,
    );
  }

  bool get isValidationError => errorType == ErrorTypes.validationError;
  bool get isDevil => errorType == ErrorTypes.devilsError;

  @override
  String toString() {
    if (errorType == ErrorTypes.validationError) {
      return errors!.errors.values.join('\n');
    }
    return message ?? 'Unknown error';
  }
}

class Errors {
  final Map<String, List<String>> errors;

  Errors(this.errors);

  factory Errors.fromJson(Map<String, dynamic> json) {
    return Errors(
        json.map((key, value) => MapEntry(key, value.cast<String>())));
  }

  String? getError(String key) {
    return errors[key]?.first;
  }
}
