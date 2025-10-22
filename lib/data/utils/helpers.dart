import 'dart:io';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:my_doctor_house_mobile_app/domain/resources/data_state.dart';
import 'package:my_doctor_house_mobile_app/services/notification_service.dart';
import 'package:retrofit/dio.dart';

Future<Either<Failure, T>> handleApiResponse<T>(
  Future<HttpResponse<T>> callback,
) async {
  try {
    final res = await callback;

    if (res.response.statusCode == HttpStatus.ok ||
        res.response.statusCode == HttpStatus.noContent) {
      return Right(res.data);
    } else {
      final errorMessage =
          res.response.statusMessage ?? 'Unexpected error occurred.';
      NotificationService.errorDialog(res.response.data['message']);
      return Left(
        Failure(errorMessage),
      );
    }
  } on DioException catch (error) {
    final errorMessage = _getDioErrorMessage(error);
    NotificationService.errorDialog(
        error.response?.data['message'] ?? errorMessage);
    return Left(
      Failure(errorMessage),
    );
  } catch (e) {
    final errorMessage = 'An unexpected error occurred: $e';
    NotificationService.errorDialog(errorMessage);
    return Left(
      Failure(errorMessage),
    );
  }
}

String _getDioErrorMessage(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionError:
      return 'Connection timeout. Please try again later.';
    case DioExceptionType.sendTimeout:
      return 'Send timeout. Please try again later.';
    case DioExceptionType.receiveTimeout:
      return 'Receive timeout. Please try again later.';
    case DioExceptionType.badResponse:
      return 'Server error: ${error.response?.statusCode} - ${error.response?.statusMessage}';
    case DioExceptionType.cancel:
      return 'Request was cancelled. Please try again.';
    case DioExceptionType.connectionTimeout:
      return 'No internet connection or an unknown error occurred.';
    case DioExceptionType.unknown:
      return 'No internet connection or an unknown error occurred.';
    default:
      return 'An unexpected error occurred.';
  }
}
