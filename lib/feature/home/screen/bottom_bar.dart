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
  void _showOverlay(BuildContext context) async {

    // Declaring and Initializing OverlayState
    // and OverlayEntry objects
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
        builder: (context) {

      // You can return any widget you like
      // here to be displayed on the Overlay
      return Positioned(
        left: MediaQuery.of(context).size.width * 0.2,
        top: MediaQuery.of(context).size.height * 0.3,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Stack(
            children: [
              FlutterLogo(),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.13,
                left: MediaQuery.of(context).size.width * 0.13,
                child: Material(
                  color: Colors.amber,
                  child: Text(
                    'I will disappear in 3 seconds.',
                    style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        color: Colors.green),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });

    // Inserting the OverlayEntry into the Overlay
    overlayState!.insert(overlayEntry);

    // Awaiting for 3 seconds
    await Future.delayed(Duration(seconds: 3));

    // Removing the OverlayEntry from the Overlay
    overlayEntry.remove();
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
                // calling the _showOverlay method
                // when Button is pressed
                _showOverlay(context);
                // setState(() {
                //   tabControl.animateTo(0);
                // });
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
