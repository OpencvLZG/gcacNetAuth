import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gcac_net_auth/constant/constant.dart';

void showModelDialog(String res, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => GestureDetector(
      child: Center(
        child: Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              height: 195,
              width: 300,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 66, 160, 237).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            res == "null" ? "登录成功" : "登录失败",
                            style: KDefaultTextStylet,
                          ),
                        ),
                        Divider(
                          height: 3,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Text(
                          res,
                          style: KDefaultTextStylet,
                        ),
                        Expanded(child: Container()),
                        Divider(
                          height: 3,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "确定",
                              style: KDefaultTextStylet,
                            ))
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
  );
}

void showChooseDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => GestureDetector(
      child: Center(
        child: Container(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              height: 195,
              width: 300,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: BoxDecoration(
                  color: Colors.blue.withAlpha(150),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "是否保存",
                            style: KDefaultTextStylet,
                          ),
                        ),
                        Divider(
                          height: 3,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                    height: 100,
                    child: Column(
                      children: [
                        Text(
                          "res",
                          style: KDefaultTextStylet,
                        ),
                        Expanded(child: Container()),
                        Divider(
                          height: 3,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
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
  );
}
