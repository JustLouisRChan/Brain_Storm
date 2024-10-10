import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';


class BottomNav extends StatefulWidget {
  @override
  _BotNavState createState() => _BotNavState();
}

class _BotNavState extends State<BottomNav>{
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child : buildBottomNavigationBar(),
      );
  }

  Widget buildNavItem(String title, IconData icon, double size, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: size,
            color: selectedIndex == index
                ? Color.fromRGBO(86, 63, 232, 1)
                : Colors.grey,
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: selectedIndex == index
                ? Color.fromRGBO(86, 63, 232, 1)
                : Colors.grey,
              fontFamily: 'Inter',
              fontSize: 7,
              height: 2.29,
            ),
          ),
        ],
      ),
    );
  }
  
  Widget buildBottomNavigationBar() {
        return Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buildNavItem('Home', Boxicons.bx_home, 25,0),
            buildNavItem('My Courses', Boxicons.bx_book, 25,1),
            buildNavItem('', Boxicons.bx_cloud_lightning, 35,2),
            buildNavItem('Inbox', Boxicons.bx_envelope, 25,3),
            buildNavItem('Profile', Boxicons.bx_user, 25,4),
          ],
        ),
      );
    }
  
}
