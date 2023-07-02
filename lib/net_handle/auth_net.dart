import 'dart:convert';

import 'package:gcac_net_auth/uaHeader/uaHeader.dart';
import 'package:http/http.dart' as http;

class AuthUser {
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

  AuthUser(this.userid, this.passwd, this.wlanuserip);

  Future<bool> authNet() async {
    Uri url = Uri.parse('');
    Map<String, String> httpHeader = Map();
    httpHeader["GET"] = "";
    httpHeader["Host"] = "pt.gcac.edu.cn";
    httpHeader["Connection"] = "keep-alive";
    httpHeader["Accept"] = "application/json,text/javascript, */*;q=0.01";
    httpHeader["User-Agent"] = "";
    httpHeader["X-Requested-With"] = "XMLHttpRequest";
    httpHeader["Sec-Fetch-Site"] = "same-origin";
    httpHeader["Sec-Fetch-Mode"] = "cors";
    httpHeader["Sec-Fetch-Dest"] = "empty";
    httpHeader["Referer"] = "";
    httpHeader["Accept-Encoding"] = "gzip,deflate";
    httpHeader["Accept-Language"] = "zh-cn,zh;q=0.0,en-Us;q=0.8,en;q=0.7";
    httpHeader["Cookie"] = " ";
    http.Response response = await http.get(url, headers: httpHeader);

    if (response.statusCode == 200) {
      var JsonData = jsonEncode(response);
      if (JsonData[0] == "0") {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
      throw "Request was unsuccessful";
    }
    return true;
  }
}
