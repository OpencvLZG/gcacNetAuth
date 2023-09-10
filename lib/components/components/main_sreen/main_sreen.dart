import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gcac_net_auth/constant/constant.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gcac_net_auth/controller/net_handle/getIp.dart';
import 'package:gcac_net_auth/utils/regex/regexIp.dart';
import 'package:gcac_net_auth/utils/sqlite/accountSql.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../bean/accounts/account.dart';
import '../../../bean/uaHeader/uaHeader.dart';
import '../../../controller/net_handle/auth_net.dart';

class MainSreen extends StatefulWidget {
  const MainSreen({super.key});

  @override
  State<MainSreen> createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreen> {
  bool _passWordMd = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _ipController = TextEditingController();
  TextEditingController _acController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  String account = "";
  String userAccount = "";
  String passWord = "";
  List<String> uaNameList = [];
  String choosedUaName = "null";
  List<String> accountList = [];
  String chooseAccount = "";
  String authIp = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshAccount();

    for (UaHeader uaHeader in UaHeaderList) {
      uaNameList.add(uaHeader.uaName);
    }

    if (!uaNameList.isEmpty) {
      choosedUaName = uaNameList[0];
    }
    if (!accountList.isEmpty) {
      chooseAccount = accountList[0];
    }
    if (authIp == "") {
      Future<String> response = getIp(_ipController);
    }
  }

  void refreshAccount() async {
    List<String> templList = [];
    Database _engine = await initDatabase();
    print("query account");
    templList.clear();
    accountList.clear();
    for (Account ac in await queryAccount(_engine)) {
      print(ac);
      templList.add(ac.acccount);
    }
    sleep(Duration(microseconds: 5));
    if (mounted) {
      setState(() {
        accountList.addAll(templList);
      });
    }

    if (!accountList.isEmpty) {
      print("update ca");
      print(chooseAccount);
      print(accountList[0]);

      chooseAccount = accountList[0];
    }
  }

  void queryPasswd(String account) async {
    Database _engine = await initDatabase();
    List<Map<String, dynamic>> accounts =
        await queryPassword(_engine, chooseAccount);
    print(chooseAccount);
    print(account);
    print(accounts);
    if (!accounts.isEmpty) {
      if (accounts[0]["password"] != "") {
        _pwController.text = accounts[0]["password"];
      }
    }

    // setState(() {
    //
    // });
  }

  void addAccount() async {
    Database _engine = await initDatabase();
    insertAccount(_engine.database, account, passWord);
    // refreshAccount();
  }

  bool regexIP(String ip) {
    final ipRegExp = RegExp(r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}'
        r'(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$');
    if (ipRegExp.hasMatch(ip)) {
      return true;
    } else {
      return false;
    }
  }

  DropdownMenuItem<String> buildMeauItem(String item) => DropdownMenuItem(
      value: item,
      child: Text(
        item,
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
      ));
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueAccent,
        child: Stack(
          children: <Widget>[
            Container(
              height: 250,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.6),
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.4),
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.2),
                    Colors.white.withOpacity(0.1),
                    Colors.white.withOpacity(0),
                  ])),
              child: Center(
                // margin: EdgeInsets.only(top: 50),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1000),
                            image: DecorationImage(
                                image: AssetImage("assets/imgs/cil.jpg"))),
                      ).animate(delay: Duration(microseconds: 500)).fade().move(
                          begin: const Offset(-100, 0),
                          curve: Curves.easeOutQuad),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "GcacNetAuth",
                            style: TextStyle(
                                fontSize: 30,
                                color: KDeafultFontColor2.withOpacity(0.7)),
                          ),
                          Text(
                            "TechnologyBy-BiliBili(Cilang)",
                            style: TextStyle(
                                fontSize: 15,
                                color: KDeafultFontColor2.withOpacity(0.5)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.all(40),
                height: 600,
                width: size.width,
                decoration: BoxDecoration(
                  color: KDefaultColor2,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Form(
                      key: _formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                                controller: _ipController,
                                validator: (value) {
                                  if (!regexIP(value.toString())) {
                                    return "Ip format error";
                                  }
                                },
                                onSaved: (newValue) => authIp = newValue!,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.network_check),
                                  labelText: "Ip",
                                  helperText: "Client Ip",
                                  // errorText: "errorText",
                                  hintText: "Plase Input User Ip",
                                )),
                            TextFormField(
                                controller: _acController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "UserAccount Cant null";
                                  }
                                },
                                onSaved: (newValue) => account = newValue!,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(Icons.person),
                                  labelText: "Account",
                                  helperText: "Gcac Account",
                                  // errorText: "errorText",
                                  hintText: "Plase Input User Account",
                                )),
                            TextFormField(
                                controller: _pwController,
                                obscureText: _passWordMd,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password Cant null";
                                  }
                                },
                                onSaved: (newValue) => passWord = newValue!,
                                decoration: InputDecoration(
                                  helperText: "Password",
                                  labelText: "PassWord",
                                  prefixIcon: Icon(Icons.lock),
                                  // prefixText: "prefixText",
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: _passWordMd
                                          ? Colors.grey
                                          : Colors.blueAccent,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passWordMd = !_passWordMd;
                                      });
                                    },
                                  ),
                                  // suffixText: "suffixText",
                                )),
                            Container(
                              height: 50,
                              width: size.width,
                              child: Center(
                                child: DropdownButton<String>(
                                  // style: TextStyle(
                                  //     fontSize: 17, color: Colors.grey),
                                  dropdownColor: Colors.blue[300],
                                  borderRadius: BorderRadius.circular(20),
                                  value: choosedUaName,
                                  isExpanded: true,
                                  underline: Container(
                                    height: 2,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  iconSize: 36,
                                  items: uaNameList.map(buildMeauItem).toList(),
                                  onChanged: (value) => setState(() {
                                    choosedUaName = value!;
                                  }),
                                ),
                              ),
                            ),
                            Text(
                              "UaHeader",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                            Container(
                              height: 50,
                              width: size.width,
                              child: Center(
                                child: DropdownButton<String>(
                                  borderRadius: BorderRadius.circular(20),
                                  value: chooseAccount,
                                  isExpanded: true,
                                  underline: Container(
                                    height: 2,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                  dropdownColor: Colors.blue[300],
                                  iconSize: 36,
                                  items:
                                      accountList.map(buildMeauItem).toList(),
                                  onChanged: (value) => setState(() {
                                    chooseAccount = value!;
                                    account = value!;
                                    _acController.text = value!;
                                    queryPasswd(account);
                                  }),
                                ),
                              ),
                            ),
                            Text(
                              "UserAccount",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 50,
                                width: 300,
                                // decoration: BoxDecoration(
                                //     color: Colors.white.withOpacity(0.5)),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Colors.blue.withOpacity(0.8),
                                      side: BorderSide(
                                          color: Colors.blue, width: 2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: Text('AuthNet',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () async {
                                    // print(passWord);
                                    if ((_formKey.currentState as FormState)
                                        .validate()) {
                                      (_formKey.currentState as FormState)
                                          .save();
                                      // print(authIp);
                                      // print(userAccount);
                                      // print(passWord);
                                      // print(choosedUaName);
                                      String ua = "";
                                      // UaHeaderList[choosedUaName];
                                      for (var i = 0;
                                          i < uaNameList.length;
                                          i++) {
                                        if (choosedUaName == uaNameList[i]) {
                                          ua = UaHeaderList[i].Data;
                                        }
                                      }

                                      // String url =
                                      //     'https://pt.gcac.edu.cn/quickauth.do';
                                      String url =
                                          'http://10.95.254.8/quickauth.do';
                                      AuthUser netAuth = AuthUser(
                                          account, passWord, authIp, ua);
                                      print(netAuth);
                                      // bool _scLabel = true;
                                      bool _scLabel =
                                          await netAuth.authNet(url, context);
                                      if (_scLabel) {
                                        addAccount();

                                        setState(() {
                                          refreshAccount();
                                        });
                                      }
                                    }
                                  },
                                ),
                              ),

                              // SizedBox(
                              //   height: 50,
                              //   width: 150,
                              //   child: ElevatedButton(
                              //     style: ElevatedButton.styleFrom(
                              //         primary: Colors.blue[300],
                              //         shape: RoundedRectangleBorder(
                              //             borderRadius: BorderRadius.circular(10))),
                              //     child: Text('DownOnline',
                              //         style: TextStyle(
                              //             fontSize: 17,
                              //             fontWeight: FontWeight.bold)),
                              //     onPressed: () {
                              //       String url = 'http://10.95.254.8/quickauthdisconn.do';

                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
                .animate(delay: Duration(milliseconds: 500))
                .fade()
                .move(begin: const Offset(0, 100), curve: Curves.easeOutQuad),
          ],
        ),
      ),
    );
  }
}
