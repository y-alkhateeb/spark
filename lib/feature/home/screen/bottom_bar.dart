import 'package:flutter/material.dart';
import 'home_screen.dart';


class BottomBar extends StatefulWidget {
  static const routeName = "/bottomBar";

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with SingleTickerProviderStateMixin {
  late TabController tabControl;

  @override
  void initState() {
    tabControl = TabController(length: 3, vsync: this, initialIndex: 0)
      ..addListener(() {
        _onTapBottomNavigationBar(tabControl.index);
      });
    super.initState();
  }

  _onTapBottomNavigationBar(int index) {
    tabControl.animateTo(index);
    /// To apply change icon color
    if(mounted)
      setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Spark"),
      ),
      bottomNavigationBar: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  tabControl.animateTo(0);
                });
              },
            ),
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  tabControl.animateTo(1);
                });
              },
            ),
            IconButton(
              iconSize: 30.0,
              icon: Icon(Icons.notifications),
              onPressed: () {
                setState(() {
                  tabControl.animateTo(2);
                });
              },
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabControl,
        physics: const BouncingScrollPhysics(),
        children: [
          HomeScreen(),
          Scaffold(body: Center(child: Text("login"),),),
          Scaffold(body: Center(child: Text("message"),),),
        ],
      ),
    );
  }
}
