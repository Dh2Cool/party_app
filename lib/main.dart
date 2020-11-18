import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main(List<String> args) {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Title("My App")',
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var pad = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
  double gap = 10;
  int _index = 0;

  List<Color> colors = [
    Colors.pink,
    Colors.green,
    Colors.orange[400],
    Colors.lightBlue,
  ];

  List<Text> text = [
    Text(
      'Home',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      'Search',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      'Favourites',
      style: TextStyle(fontSize: 30),
    ),
    Text(
      'Account',
      style: TextStyle(fontSize: 30),
    ),
  ];

  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 4,
        controller: controller,
        onPageChanged: (page) {
          setState(() {
            _index = page;
          });
        },
        itemBuilder: (
          context,
          position,
        ) {
          return Container(
            color: colors[position],
            child: Center(
              child: text[position],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              boxShadow: [
                BoxShadow(
                    spreadRadius: -10,
                    blurRadius: 60,
                    color: Colors.black.withOpacity(0.4),
                    offset: Offset(0, 25))
              ]),
          child: GNav(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 900),
            tabs: [
              GButton(
                gap: gap,
                icon: Icons.home,
                iconColor: Colors.black,
                iconActiveColor: Colors.pink,
                text: 'Home',
                textColor: Colors.pink,
                backgroundColor: Colors.pink.withOpacity(0.2),
                iconSize: 24,
                padding: pad,
              ),
              GButton(
                gap: gap,
                icon: Icons.search,
                iconColor: Colors.black,
                iconActiveColor: Colors.green,
                text: 'Search',
                textColor: Colors.green,
                backgroundColor: Colors.green.withOpacity(0.2),
                iconSize: 24,
                padding: pad,
              ),
              GButton(
                gap: gap,
                icon: Icons.star,
                iconColor: Colors.black,
                iconActiveColor: Colors.orange[400],
                text: 'Favourites',
                textColor: Colors.orange,
                backgroundColor: Colors.orange[400].withOpacity(0.2),
                iconSize: 24,
                padding: pad,
              ),
              GButton(
                gap: gap,
                icon: Icons.person,
                iconColor: Colors.black,
                iconActiveColor: Colors.lightBlue,
                text: 'Account',
                textColor: Colors.lightBlue,
                backgroundColor: Colors.lightBlue.withOpacity(0.2),
                iconSize: 24,
                padding: pad,
              ),
            ],
            selectedIndex: _index,
            onTabChange: (index) {
              setState(() {
                _index = index;
              });
              controller.jumpToPage(index);
            },
          ),
        ),
      ),
    );
  }
}
