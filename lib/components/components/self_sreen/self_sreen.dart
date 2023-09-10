import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:gcac_net_auth/constant/constant.dart';
import 'package:url_launcher/url_launcher.dart';

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
              height: 50,
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
            // SizedBox(
            //   height: 30,
            // ),

            Container(
              child: Text(
                "I am cilang, a full stack developer\n\nContact me\ngithub/OpencvLZG\ngitee/CilangZzZ",
                style: TextStyle(
                    color: KDeafultFontColor2.withOpacity(0.7), fontSize: 16),
              ),
            ),
            Container(
              height: 300,
              child: ListView(
                children: selfSettingBar(),
              ),
            )
          ],
        ),
      ),
    ).animate(delay: Duration(microseconds: 500)).fade();
  }

  List<Widget> selfSettingBar() {
    List<Widget> widgets = [];
    List titles = ["Setting", "Account", "ContactUs", "Github", "Exit"];
    List<IconData> icons = [
      Icons.settings,
      Icons.person,
      Icons.person_4_outlined,
      Icons.link,
      Icons.exit_to_app_rounded
    ];
    for (var i = 0; i < titles.length; i++) {
      print(titles[i]);
      widgets.add(
        GestureDetector(
          onTap: () async {
            print("launchUrl");
            await launchUrl(Uri.parse("https://github.com/OpencvLZG"),
                mode: LaunchMode.inAppWebView);
          },
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
                      icons[i],
                      color: KDeafultFontColor2,
                    ),
                  ),
                  Text(
                    titles[i],
                    style: KDefaultTextStylet,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.keyboard_arrow_left_sharp,
                        color: KDeafultFontColor2,
                        size: 25,
                      ))
                ],
              ),
            ),
          ),
        ),
      );
    }

    widgets = widgets
        .animate(interval: 200.ms)
        .fadeIn(duration: 600.ms, delay: 200.ms)
        .shimmer(
            blendMode: BlendMode.srcOver, color: Colors.blue.withOpacity(0.5))
        .move(begin: const Offset(0, 30), curve: Curves.easeOutQuad);
    return widgets;
  }
}
