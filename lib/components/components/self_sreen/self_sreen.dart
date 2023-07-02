import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:gcac_net_auth/constant/constant.dart';

class SelfSreen extends StatefulWidget {
  const SelfSreen({super.key});

  @override
  State<SelfSreen> createState() => _SelfSreenState();
}

class _SelfSreenState extends State<SelfSreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      color: KDeafultColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      image: DecorationImage(
                          image: AssetImage("assets/imgs/1.jpg"),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: AlignmentDirectional.bottomCenter,
                              colors: [
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0),
                                Colors.black.withOpacity(0),
                                Colors.black,
                                Colors.black
                              ]),
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(300))),
                    )),
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 30,
                      width: 100,
                      child: Center(
                        child: Text(
                          "Cilang",
                          style: TextStyle(
                              color: KDeafultFontColor2,
                              fontSize: KDefaultFontSize,
                              fontWeight: KDefaultFontWeight),
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              child: Text(
                "I am cilang, a full stack developer\n\nContact me\ngithub/OpencvLZG\ngitee/CilangZzZ",
                style: TextStyle(
                    color: KDeafultFontColor2.withOpacity(0.7), fontSize: 16),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    color: KDeafultFontColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.settings,
                          color: KDeafultFontColor2,
                        ),
                      ),
                      Text(
                        "Setting",
                        style: KDefaultTextStylet,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_left,
                            color: KDeafultFontColor2,
                            size: 25,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    color: KDeafultFontColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person,
                          color: KDeafultFontColor2,
                        ),
                      ),
                      Text(
                        "Account",
                        style: KDefaultTextStylet,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_left,
                            color: KDeafultFontColor2,
                            size: 25,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    color: KDeafultFontColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.person_4_outlined,
                          color: KDeafultFontColor2,
                        ),
                      ),
                      Text(
                        "ContactUs",
                        style: KDefaultTextStylet,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_left,
                            color: KDeafultFontColor2,
                            size: 25,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    color: KDeafultFontColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.link,
                          color: KDeafultFontColor2,
                        ),
                      ),
                      Text(
                        "Github",
                        style: KDefaultTextStylet,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_left,
                            color: KDeafultFontColor2,
                            size: 25,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                height: 50,
                width: 400,
                decoration: BoxDecoration(
                    color: KDeafultFontColor2.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.exit_to_app,
                          color: KDeafultFontColor2,
                        ),
                      ),
                      Text(
                        "Exit",
                        style: KDefaultTextStylet,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_left,
                            color: KDeafultFontColor2,
                            size: 25,
                          ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ).animate(delay: Duration(microseconds: 500)).fade();
  }
}
