import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wifi_info_plugin_plus/wifi_info_plugin_plus.dart';
import 'package:http/http.dart' as http;

import '../../utils/regex/interfaceRegexIp.dart';
import '../../utils/regex/vaildIp.dart';

Future<String> getLocalIP() {
  return NetworkInterface.list(includeLoopback: false, includeLinkLocal: false)
      .then((interfaces) {
    for (var interface in interfaces) {
      List params = parseInterfaceIp(interface.addresses.toString());

      if (params[1] != "IPv4") {
        continue;
      }
      if (validateIP(params[0])) {
        return params[0];
      }
    }
    return "";
  });
}

Future<String> getIp(TextEditingController ipController) async {
  // print(Process.runSync('ipconfig', []).stdout as String);
  //  => interface.addresses.first.type == InternetAddressType.IPv4)
  if (Platform.isWindows) {
    ipController.text = await getLocalIP();
    return getLocalIP();
  }

  try {
    WifiInfoWrapper? _wifiObject;
    try {
      _wifiObject = await WifiInfoPlugin.wifiDetails;
    } catch (e) {
      return "";
    }
    String ipAddress =
        _wifiObject != null ? _wifiObject!.ipAddress.toString() : "...";

    ipController.text = ipAddress;

    return ipAddress;
    // Uri url = Uri.parse('http://2.2.2.2/');
    // http.Response response = await http.get(url, headers: {
    //   // "GET": "/ HTTP/1.1",
    //   // "Host": "2.2.2.2",
    //   "Connection": "keep-alive",
    //   "Upgrade-Insecure-Requests": "1",
    //   "User-Agent":
    //       "Mozilla/5.0 (Linux; Android 12; RMX3085) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/112.0.0.0 Mobile Safari/537.36",
    //   "Accept": "text/html",
    //   "X-Requested-With": "mark.via",
    //   "Accept-Encoding": "gzip,deflate",
    //   "Accept-Language": "zh-CN;q=0.9"
    // }).timeout(const Duration(seconds: 30));
    // print(response.statusCode);
    // return response.toString();
  } catch (e) {
    print(e);
    return "";
  }
}
