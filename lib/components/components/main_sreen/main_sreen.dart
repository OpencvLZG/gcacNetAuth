import 'package:flutter/material.dart';
import 'package:gcac_net_auth/constant/constant.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MainSreen extends StatefulWidget {
  const MainSreen({super.key});

  @override
  State<MainSreen> createState() => _MainSreenState();
}

class _MainSreenState extends State<MainSreen> {
  bool _passWordMd = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String userAccount = "";
  String passWord = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.blueAccent,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(40),
              height: 700,
              width: size.width,
              decoration: BoxDecoration(
                color: KDefaultColor2,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Container(
                      child: Column(
                        children: [
                          TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "UserAccount Cant null";
                                }
                              },
                              onSaved: (newValue) => userAccount = newValue!,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                labelText: "Account",
                                helperText: "Gcac Account",
                                // errorText: "errorText",
                                hintText: "Plase Input User Account",
                              )),
                          TextFormField(
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
                                        ? Colors.blueAccent
                                        : Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passWordMd = !_passWordMd;
                                    });
                                  },
                                ),
                                // suffixText: "suffixText",
                              ))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                    margin: EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 270,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text('Login',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              // print(passWord);
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                (_formKey.currentState as FormState).save();
                                print(userAccount);
                                print(passWord);
                              }
                            },
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 270,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text('DownOnline',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold)),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      )
          .animate(delay: Duration(microseconds: 2))
          .fade()
          .move(begin: const Offset(0, 100), curve: Curves.easeOutQuad),
    );
  }
}
