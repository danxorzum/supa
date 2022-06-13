import 'package:supa/core/tools/models/supa_error.dart';
import 'package:supa/core/tools/models/supa_laravel_paginator.dart';

class SupaResponse<T> {
  ///On a simple response, if [paginator] is null, the [data] is a [T]
  final T? data;

  ///if something went wrong, the [error] is a [SupaError] else it is null
  final SupaError? error;

  ///An optional paginator based on larvel paginator.
  final SupaLaravelPaginator<T>? paginator;

  //Getters
  bool get isSuccess => error == null;
  bool get isError => error != null;
  bool get hasPaginator => paginator != null;

  SupaResponse({this.data, this.error, this.paginator}) {
    assert(data != null || error != null || paginator != null,
        'SupaResponse must have one of these three values: data, error or paginator');
  }

  factory SupaResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) decoder,
      {void Function(ErrorTypes)? onError}) {
    return SupaResponse(
      data: json['current_page'] == null && json['error'] == null
          ? decoder(json)
          : null,
      error: json['error'] != null
          ? SupaError.fromJson(json['error'], onError: onError)
          : null,
      paginator: json['error'] == null && json['current_page'] != null
          ? SupaLaravelPaginator.fromJson(json, decoder)
          : null,
    );
  }
}
