import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MakeCurl {
  static writeCurl({
    required String location,
    Map<String, dynamic>? headers,
    String? body,
    required bool clipBoard,
  }) {
    List<String> curl = [];
    debugPrintSynchronously('');
    debugPrintSynchronously('=========================== cURL start =============================');

    curl = _curlString('curl --location \'$location\' \\', curl: curl);

    if (headers != null) {
      for (var key in headers.keys) {
        var item = headers[key];
        curl = _curlString('--header \'$key: $item\' \\', curl: curl);
      }
    }

    if (body?.isNotEmpty == true) {
      var bodyList = body!.split(',');
      curl = _curlString('--data-raw \'${bodyList.first},', curl: curl);
      for (var i = 1; i < bodyList.length - 1; i++) {
        curl = _curlString(' ${bodyList[i]},', curl: curl);
      }
      curl = _curlString(' ${bodyList[bodyList.length - 1]}\' ', curl: curl);
    }

    String summary = curl.join('\n');
    if ((clipBoard) && (kDebugMode)) {
      Clipboard.setData(ClipboardData(text: summary));
    }

    debugPrintSynchronously('=========================== cURL end =============================');
    debugPrintSynchronously('');
  }

  static List<String> _curlString(String txt, {required List<String> curl}) {
    var curlL = curl.toList();
    curlL.add(txt);
    debugPrintSynchronously(txt);

    return curlL;
  }
}
