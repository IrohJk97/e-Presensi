import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'nav_items.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Curved Navigation Bar Example',
      home: Home(accessToken: '',),
    );
  }
}

class Home extends StatefulWidget {
  final String accessToken;

  Home({required this.accessToken});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Curved Navigation Bar Example')),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: <Widget>[
          Center(child: Text('Home Page')),
          Center(child: Text('Edit Page')),
          Center(child: Text('Fingerprint Page')),
          Center(child: Text('Profile Page')),
          Center(child: Text('Phone Page')),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueGrey,
        buttonBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        color: Color.fromARGB(255, 255, 255, 255),
        height: 65,
        items: navItems.map((item) {
          return Icon(
            item.icon,
            size: 35,
            color: _currentIndex == item.index ? Colors.blue : Colors.grey,
          );
        }).toList(),
        index: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);
        },
      ),
    );
  }
}