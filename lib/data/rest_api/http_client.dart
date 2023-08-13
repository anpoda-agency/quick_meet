import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quick_meet/core/contant.dart';
import 'package:quick_meet/data/models/server_response.dart';
import 'package:quick_meet/data/rest_api/make_curl.dart';
import 'package:quick_meet/data/rest_api/write_log.dart';

abstract class HTTPClient {
  static String path({
    required String command,
    required String params,
    required Map<String, dynamic>? args,
    required Uri url,
  }) {
    if (params != '') WriteLogs.write('         params: $params');

    return url
        .replace(
          path: ((command != '') ? command : '') + ((params != '') ? '/$params' : ''),
          queryParameters: args,
        )
        .toString();
  }

  static Future<ServerResponse> httpGet({
    required Uri serverUrl,
    required String command,
    required String token,
    required String params,
    required Map<String, dynamic>? args,
    required Dio? client,
    required Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    ServerResponse? res;
    var location = path(command: command, params: params, args: args, url: serverUrl);
    _makeCurl(
      location: location,
      headers: headers,
    );
    final response = await client?.get(
      location,
      options: Options(headers: headers),
      queryParameters: queryParameters,
    );
    res = await responseEngine(resTxt: response);

    return res;
  }

  static Future<ServerResponse> httpDelete({
    required Uri serverUrl,
    required String command,
    // required String token,
    required String params,
    required Map<String, dynamic>? args,
    required Dio? client,
    Map<String, dynamic>? headers,
  }) async {
    ServerResponse? res;
    var location = path(command: command, params: params, args: args, url: serverUrl);
    _makeCurl(
      location: location,
      headers: headers,
    );
    try {
      final response = await client?.delete(
        location,
        options: Options(headers: headers),
      );
      res = await responseEngine(resTxt: response);
    } on DioError catch (e) {
      res = ServerResponse(
        err: e.toString(),
        msgText: e.response?.data.toString() ?? '',
        code: e.response?.statusCode.toString() ?? '',
        body: e.response?.data,
      );
      WriteLogs.write('http delete DioError $e');
    } catch (e) {
      WriteLogs.write('http delete err $e');
      res = ServerResponse(err: e.toString(), msgText: '');
    }

    return res;
  }

  static Future<ServerResponse> httpPost({
    required Uri serverUrl,
    required String command,
    required Object body,
    required String token,
    required String params,
    required Map<String, dynamic>? args,
    required Dio? client,
    required Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    ServerResponse? res;
    var location = path(command: command, params: params, args: args, url: serverUrl);
    _makeCurl(
      location: location,
      headers: headers,
      body: jsonEncode(body),
    );
    // try {
    Response? response = await client?.post(
      location,
      data: body,
      queryParameters: queryParameters,
      options: Options(headers: headers),
      // options: Options(headers: makeHeaders(token: token, type: authType)),
    );
    res = await responseEngine(resTxt: response);
    // } on DioError catch (e) {
    //   res = ServerResponse(
    //     err: e.toString(),
    //     msgText: e.response?.data.toString() ?? '',
    //     code: e.response?.statusCode.toString() ?? '',
    //     body: e.response?.data,
    //   );
    //   WriteLogs.write('http post DioError $e');
    //   throw res;
    // } catch (err) {
    //   res = ServerResponse(
    //     err: err.toString(),
    //     msgText: '',
    //   );
    //   WriteLogs.write('http post err $err');
    // }

    return res;
  }

  static Future<ServerResponse> httpPostFile({
    required Uri serverUrl,
    required String command,
    required Object body,
    required String params,
    required Map<String, dynamic>? args,
    required Dio? client,
    required Map<String, dynamic>? headers,
  }) async {
    ServerResponse? res;

    Response? response = await client?.post(
      path(command: command, params: params, args: args, url: serverUrl),
      data: body,
      options: Options(headers: headers),
    );
    res = await responseEngine(resTxt: response);

    return res;
  }

  static Future<ServerResponse> httpPostTest({
    required Uri serverUrl,
    required String command,
    required Object body,
    required String token,
    required String params,
    required Map<String, dynamic>? args,
    required Map<String, dynamic>? headers,
    required Dio? client,
  }) async {
    ServerResponse? res;

    var location = path(command: command, params: params, args: args, url: serverUrl);
    _makeCurl(
      location: location,
      headers: headers,
      body: jsonEncode(body),
    );

    Response? response = await client?.post(
      location,
      data: body,
      options: Options(headers: headers),
    );
    res = await responseEngine(resTxt: response);

    return res;
  }

  static Future<ServerResponse> httpPatch({
    required Uri serverUrl,
    required String command,
    required Object body,

//    required String token,
//    required String params,
//    required Map<String, dynamic>? args,
//    Map<String, dynamic>? headers,

    required String params,
    required Map<String, dynamic>? args,
    required Map<String, dynamic>? headers,
    required Dio? client,
  }) async {
    ServerResponse? res;

    var location = path(command: command, params: params, args: args, url: serverUrl);
    _makeCurl(
      location: location,
      headers: headers,
      body: jsonEncode(body),
    );

    try {
      Response? response = await client?.patch(
        location,
        data: body,
        options: Options(headers: headers),
      );
      res = await responseEngine(resTxt: response);
    } catch (e) {
      DioError eParsed = e as DioError;
      res = ServerResponse(err: e.toString(), msgText: eParsed.error.toString());
      WriteLogs.write('http patch err $e');
    }

    return res;
  }

  static Future<ServerResponse> httpPut({
    required Uri serverUrl,
    required String command,
    required Object body,
    required String token,
    required String params,
    required Map<String, dynamic>? args,
    required Map<String, dynamic>? headers,
    required Dio? client,
  }) async {
    ServerResponse? res;

    Response? response = await client?.put(
      path(command: command, params: params, args: args, url: serverUrl),
      data: body,
      options: Options(headers: headers),
    );
    res = await responseEngine(resTxt: response);

    return res;
  }

  static Future<ServerResponse> responseEngine({
    Response? resTxt,
  }) async {
    ServerResponse res = ServerResponse(err: 'Server not response', msgText: '');
    try {
      if (resTxt != null) {
        if (resTxt.statusCode == 200) {
          res = ServerResponse(
            code: '200',
            msgText: jsonEncode(resTxt.data),
            body: resTxt.data,
          );
          /*} else {
            res = ServerResponse(
              code: '200',
              msgText: jsonEncode(resTxt.data),
              body: resTxt.data,
              err: resTxt.data['description'],
            );
          }*/
        } else {
          res = ServerResponse(
            err: resTxt.requestOptions.data,
            code: resTxt.statusCode.toString(),
            msgText: resTxt.data.toString(),
          );
          WriteLogs.write(resTxt.statusCode.toString());
        }
      }
    } catch (e) {
      res = ServerResponse(err: e.toString(), msgText: '');
      WriteLogs.write('responseEngine err $e');
    }

    return res;
  }

  static _makeCurl({
    required String location,
    Map<String, dynamic>? headers,
    String? body,
  }) {
    try {
      if ((AppConstants.makeCurl) && (AppConstants.netLogs)) {
        MakeCurl.writeCurl(
          location: location,
          headers: headers,
          body: body,
          clipBoard: AppConstants.makeCurlClipboard,
        );
      }
    } catch (e) {
      debugPrint('_makeCurl ERROR');
      debugPrint(e.toString());
    }
  }
}
