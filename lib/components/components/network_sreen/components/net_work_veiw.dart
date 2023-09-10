import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gcac_net_auth/constant/constant.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../../../bean/accounts/account.dart';
import '../../../../utils/sqlite/accountSql.dart';

class NetWorkView extends StatefulWidget {
  const NetWorkView({super.key});

  @override
  State<NetWorkView> createState() => _NetWorkViewState();
}

class _NetWorkViewState extends State<NetWorkView> {
  List<String> networkData = [];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: BuildAnimateList(),
        )
        // .animate(delay: Duration(microseconds: 500))
        // .fade()
        // .moveX(begin: -100, end: 0, duration: Duration(milliseconds: 500)),
        );
  }

  @override
  void initState() {
    super.initState();
    refreshAccount();
  }

  void refreshAccount() async {
    List<String> templList = [];
    templList.clear();
    networkData.clear();
    Database _engine = await initDatabase();
    for (Account ac in await queryAccount(_engine)) {
      print(ac);
      templList.add(ac.acccount);
    }
    print(templList);
    setState(() {
      networkData.addAll(templList);
    });
  }

  void nothing(BuildContext account) async {}
  Future<void> delAc(String account) async {
    print(account);
    Database _engine = await initDatabase();
    deleteAccount(_engine, account);
    refreshAccount();
  }

  List<Widget> BuildAnimateList() {
    List<Widget> animateList = [];
    for (var index = 0; index < networkData.length; index++) {
      animateList.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              Container(
                child: SlidableAction(
                  onPressed: (BuildContext context) {
                    delAc(networkData[index]);
                  },
                  backgroundColor: Colors.red.withAlpha(100),
                  foregroundColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  icon: Icons.delete_forever,
                  label: 'delete',
                ),
              ),
            ],
          ),
          child: Container(
            margin: EdgeInsets.only(right: 5),
            height: 80,
            decoration: BoxDecoration(
              color: KDeafultColor.withOpacity(0.5),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text(
                    networkData[index],
                    style: KDefaultTextStylet,
                  ),
                ],
              ),
            ),
          ),
        ),
      ));
    }

    animateList = animateList
        .animate(interval: 200.ms)
        .fadeIn(duration: 600.ms, delay: 200.ms)
        .shimmer(
            blendMode: BlendMode.srcOver, color: Colors.blue.withOpacity(0.5))
        .move(begin: const Offset(-16, 0), curve: Curves.easeOutQuad);
    return animateList;
  }
}
