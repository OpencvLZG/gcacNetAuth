import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gcac_net_auth/bean/uaHeader/uaHeader.dart';
import 'package:gcac_net_auth/constant/constant.dart';
import 'package:http/http.dart' as http;

import '../../components/components/modalDialog/modalDialog.dart';

class AuthUser {
  String uaHeader;
  String userid;
  String passwd;
  String wlanuserip;
  String wlanacname = "VBASE-GZMH";
  String wlanacip = "10.95.254.1";
  String ssid = "";
  String vlan = "";
  String mac = "";
  String version = "0";
  String portalpageid = "2";
  String timestamp = "";
  String uuid = "";
  String portaltype = "";
  String hostname = "";
  String bindCtrlld = "";

  AuthUser(this.userid, this.passwd, this.wlanuserip, this.uaHeader);
  String getRandomChars() {
    List<String> chars = List.filled(8, '');
    Random random = Random();

    chars =
        chars.map((e) => String.fromCharCode(random.nextInt(26) + 97)).toList();

    return chars.join();
  }

  Future<bool> authNet(String url, BuildContext context) async {
    String params =
        "?userid=${userid}&passwd=${passwd}&wlanuserip=${wlanuserip}&wlanacname=${wlanacname}&wlanacip=${wlanacip}&ssid=${ssid}&vlan=${vlan}&mac=${mac}&version=${version}&portalpageid=${portalpageid}&timestamp=${timestamp}&uuid=${uuid}&portaltype=${portaltype}&hostname=${getRandomChars()}&bindCtrlld=${bindCtrlld}";
    url += params;
    print(url);
    Map<String, String> httpHeader = Map();
    // httpHeader[""] = "";
    httpHeader["Host"] = "pt.gcac.edu.cn";
    httpHeader["Connection"] = "keep-alive";
    httpHeader["Accept"] = "application/json,text/javascript, */*;q=0.01";
    httpHeader["User-Agent"] = uaHeader;
    httpHeader["X-Requested-With"] = "XMLHttpRequest";
    httpHeader["Sec-Fetch-Site"] = "same-origin";
    httpHeader["Sec-Fetch-Mode"] = "cors";
    httpHeader["Sec-Fetch-Dest"] = "empty";
    httpHeader["Referer"] = "";
    httpHeader["Accept-Encoding"] = "gzip,deflate";
    httpHeader["Accept-Language"] = "zh-cn,zh;q=0.0,en-Us;q=0.8,en;q=0.7";
    httpHeader["Cookie"] = " ";
    // return false;
    // showModelDialog("none", context);
    // return false;
    try {
      http.Response response = await http
          .get(
            Uri.parse(url),
            headers: httpHeader,
          )
          .timeout(Duration(seconds: 2));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonBody = json.decode(response.body);
        showModelDialog(jsonBody["message"].toString(), context);

        print(jsonBody);
        if (jsonBody["message"].toString() == "null") return true;
        // if (jsonBody["code"] == 0) {
        //   return true;
        // }else if(){}
      }
    } catch (e) {
      showModelDialog("响应超时，是否已连接校园网", context);
      return false;
    }

    return true;
  }

  Future<bool> disconnNet(
      String url, String authIp, BuildContext context) async {
    Map<String, String> httpHeader = Map();
    httpHeader[""] = "POST /quickauthdisconn.do HTTP/1.1";
    httpHeader["Host"] = "pt.gcac.edu.cn";
    httpHeader["Connection"] = "keep-alive";
    httpHeader["Content-Length"] = "";
    httpHeader["Accept"] = "application/json,text/javascript, */*;q=0.01";
    httpHeader["User-Agent"] = uaHeader;
    httpHeader["Content-Type"] =
        "application/x-www-form-urlencoded;charset=UTF-8";
    httpHeader["Origin"] = "http://pt.gcac.edu.cn";
    httpHeader["X-Requested-With"] = "XMLHttpRequest";
    httpHeader["Referer"] = "";
    httpHeader["Accept-Encoding"] = "gzip,deflate";
    httpHeader["Accept-Language"] = "zh-cn,zh;q=0.0,en-Us;q=0.8,en;q=0.7";
    httpHeader["Cookie"] = " ";
    var formValues = {
      'wlanacip': "",
      'wlanuserip': authIp,
      'wlanacname': "VBASE-GZMH",
      'version': "",
      'portaltype': "",
      'userid': "",
      'mac': "",
      'groupid': ""
    };
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: formValues)
          .timeout(Duration(seconds: 2));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonBody = json.decode(response.body);
        showModelDialog(jsonBody["message"].toString(), context);

        print(jsonBody);
        if (jsonBody["message"].toString() == "null") return true;
        // if (jsonBody["code"] == 0) {
        //   return true;
        // }else if(){}
      }
    } catch (e) {
      showModelDialog("响应超时，是否已连接校园网", context);
      return false;
    }
    return true;
  }
}
