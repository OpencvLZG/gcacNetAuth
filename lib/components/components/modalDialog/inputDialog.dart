import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../constant/constant.dart';
import '../../../utils/sqlite/accountSql.dart';

void addAccount(String account, String password) async {
  Database _engine = await initDatabase();
  insertAccount(_engine, account, password);
}

void showInputDialog(BuildContext context) {
  TextEditingController _acController = TextEditingController();
  TextEditingController _pwController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String passWord = "";
  String account = "";
  bool _passWordMd = true;
  showDialog(
    context: context,
    builder: (context) => GestureDetector(
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            child: Container(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  height: 250,
                  width: 370,
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(150),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.only(top: 10),
                        height: 175,
                        child: Column(
                          children: [
                            Form(
                                key: _formKey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: [
                                    TextFormField(
                                        controller: _acController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "UserAccount Cant null";
                                          }
                                        },
                                        onSaved: (newValue) =>
                                            account = newValue!,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          helperStyle:
                                              TextStyle(color: Colors.white),
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                          ),
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
                                        onSaved: (newValue) =>
                                            passWord = newValue!,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              TextStyle(color: Colors.white),
                                          helperStyle:
                                              TextStyle(color: Colors.white),
                                          helperText: "Password",
                                          labelText: "PassWord",
                                          prefixIcon: Icon(
                                            Icons.lock,
                                            color: Colors.white,
                                          ),
                                          // prefixText: "prefixText",

                                          // suffixText: "suffixText",
                                        )),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      Expanded(child: Container()),
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "取消",
                                  style: KDefaultTextStylet,
                                )),
                            TextButton(
                                onPressed: () {
                                  if ((_formKey.currentState as FormState)
                                      .validate()) {
                                    (_formKey.currentState as FormState).save();
                                    addAccount(
                                        _acController.text, _pwController.text);
                                    Navigator.pop(context);
                                   
                                  }
                                },
                                child: Text(
                                  "确定",
                                  style: KDefaultTextStylet,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
