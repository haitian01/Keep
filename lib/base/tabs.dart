import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keep/base/public.dart';
import 'package:keep/pages/community/comm_root_scene.dart';
import '../pages/explore/explore_root.dart';
import '../pages/sport/sport_root.dart';
import '../pages/plan/plan_root.dart';
import '../pages/me/me_root.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tabs extends StatefulWidget {
  // var tabIndex = 2;
  // Tabs(this.tabIndex);
  @override
  State<StatefulWidget> createState() => TabsState();
}

class TabsState extends State<Tabs> {
  int _tabIndex = 4;
  bool isFinishSetup = false;
  List<Image> _tabImages = [
    Image.asset('imgs/tabs_0_0.png'),
    Image.asset('imgs/tabs_1_0.png'),
    Image.asset('imgs/tabs_2_0.png'),
    Image.asset('imgs/tabs_3_0.png'),
    Image.asset('imgs/tabs_4_0.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('imgs/tabs_0_1.png'),
    Image.asset('imgs/tabs_1_1.png'),
    Image.asset('imgs/tabs_2_1.png'),
    Image.asset('imgs/tabs_3_1.png'),
    Image.asset('imgs/tabs_4_1.png'),
  ];

  @override
  void initState() {
    super.initState();

    setupApp();
  }

  @override
  void dispose() {
    super.dispose();
  }

  setupApp() async {
    // preferences = await SharedPreferences.getInstance();
    setState(() {
      isFinishSetup = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    if (!isFinishSetup) {
      return Container();
    }

    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          KeepCommRootScene(),
          ExploreRootScene(),
          SportPage(),
          PlanPage(),
          MePage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: Z6Color.deep_kgray,
        inactiveColor: Z6Color.kgray,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('社区')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('探索')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('运动')),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text('计划')),
          BottomNavigationBarItem(icon: getTabIcon(4), title: Text('我')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
