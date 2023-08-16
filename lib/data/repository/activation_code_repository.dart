import 'package:dio/dio.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_response.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_response.dart';
import 'package:quick_meet/data/network/api/activation_code_api.dart';
import 'package:quick_meet/data/network/dio_exception.dart';

class ActivationCodeRepository {
  final ActivationCodeApi activationCodeApi;

  ActivationCodeRepository({required this.activationCodeApi});

  Future<CodeConfirmNumberResponse> codeSend({required CodeConfirmNumberRequest request}) async {
    try {
      final response = await activationCodeApi.codeSend(request: request);
      return CodeConfirmNumberResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<CodeSendActivationResponse> codeConfirm({required CodeSendActivationRequest request}) async {
    try {
      final response = await activationCodeApi.codeConfirm(request: request);
      return CodeSendActivationResponse.fromJson(response.data);
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
