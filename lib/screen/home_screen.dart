import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mceasy/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _bottomNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: homeSegment[_bottomNavIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        gapWidth: 10,
        itemCount: navbarIcon.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? const Color(0xFFE63D26) : Colors.grey[300];
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                navbarIcon[index],
                color: color,
                size: 30,
              ),
              const SizedBox(height: 4),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    textNavbar[index],
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ))
            ],
          );
        },
        backgroundColor: primaryColors,
        activeIndex: _bottomNavIndex,

        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
        //other params
      ),
    );
  }
}
