import 'package:dio/dio.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_confirm_number_request.dart';
import 'package:quick_meet/data/models/activation_code_controller/code_send_activation_request.dart';
import 'package:quick_meet/data/network/dio_client.dart';

class ActivationCodeApi {
  final DioClient dioClient;

  ActivationCodeApi({required this.dioClient});

  Future<Response> codeSend(
      {required CodeSendActivationRequest request}) async {
    try {
      final Response response = await dioClient.post(
        AppConstants.sendUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> codeConfirm(
      {required CodeConfirmNumberRequest request}) async {
    try {
      final Response response = await dioClient.post(
        AppConstants.confirmUrl,
        body: request.toJson(),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
