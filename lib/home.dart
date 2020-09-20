import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:ten_news/screens/home/homepage.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(padding: EdgeInsets.symmetric(horizontal: 25),
        child: Builder(
          builder: (context) => IconButton(
            icon: Image.network("https://images.unsplash.com/photo-1600475935701-18188d24ff18?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80"),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),),
        ),
        titleSpacing: 0,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            DrawerHeader(
              child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
  'https://github.com/flutter/plugins/raw/master/packages/video_player/video_player/doc/demo_ipod.gif?raw=true',
),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'LogOut',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 45,
            ),
            Material(
              borderRadius: BorderRadius.circular(500),
              child: InkWell(
                borderRadius: BorderRadius.circular(500),
                splashColor: Colors.black45,
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.black,
                  child: Icon(Icons.arrow_back, color:Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 65,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                  child:  Center(
                    child: Text(
                      'V 1.0.1',
                      style: TextStyle(fontSize: 24, 
                      fontWeight: FontWeight.w600, 
                      color: Colors.white
                      ),
                    ),
                  ),
                  ),
                ),
            ),
          ],
        ),
      ),
      body: <Widget>[
        HomePage(),
        Container(
          color: Colors.red,
        ),
        Container(color: Colors.yellow),
        Container(
          color: Colors.green,
        )
      ][currentIndex],
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        hasNotch: true,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("Logs")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.folder_open,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.folder_open,
                color: Colors.indigo,
              ),
              title: Text("Folders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              title: Text("Menu")),
        ],
      ),
    );
  }
}
