import 'package:flutter/material.dart';
import 'package:flutter_app/pages/botnav.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isLargeScreen = screenSize.width > 600;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            _topNav(isLargeScreen),
            _courseCardContainer(),
            _buildVersion(),
            BottomNav(),
          ],
        ),
      ),
    );
  }

  Widget _buildVersion() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        'v0.1 (Beta)',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Color.fromRGBO(51, 51, 51, 1),
          fontFamily: 'Inter',
          fontSize: 12,
          height: 1.54,
        ),
      ),
    );
  }

  Widget _courseCardContainer() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            _CourseCard('Discreet Math', 14,Color.fromRGBO(39, 15, 191, 1),Boxicons.bx_calculator),
            _CourseCard('Discreet Math', 14,Color.fromRGBO(39, 15, 191, 1),Boxicons.bx_calculator),
            _CourseCard('Discreet Math', 14,Color.fromRGBO(39, 15, 191, 1),Boxicons.bx_calculator),
            _CourseCard('Discreet Math', 14,Color.fromRGBO(39, 15, 191, 1),Boxicons.bx_calculator),
            _CourseCard('Discreet Math', 14,Color.fromRGBO(39, 15, 191, 1),Boxicons.bx_calculator),
            _CourseCard('Discreet Math', 14,Color.fromRGBO(39, 15, 191, 1),Boxicons.bx_calculator),
            _CourseCard('Discreet Math', 14,Color.fromRGBO(39, 15, 191, 1),Boxicons.bx_calculator),

          ],
        ),
      ),
    );
  }

  Widget _topNav(bool isLargeScreen) {
    return Container(
      padding: EdgeInsets.all(isLargeScreen ? 24 : 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(12),
          bottomRight: Radius.circular(12),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Courses',
            style: TextStyle(
              color: Color.fromRGBO(39, 15, 191, 1),
              fontFamily: 'Inter',
              fontSize: isLargeScreen ? 28 : 20,
              height: 1.2,
            ),
          ),
          Icon(
            Boxicons.bx_book_bookmark,
            color: Color.fromRGBO(39, 15, 191, 1),
          ),
        ],
      ),
    );
  }

  Widget _CourseCard(String title, int count,Color color, IconData icon) {
    return Column(
      children: [
        buildCourseCard(title, count,color,icon),
        SizedBox(height: 15),
      ],
    );
  }

  Widget buildCourseCard(String title, int count , Color color, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(184, 172, 255, 1),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 24,
            height: 24,
            child: Stack(
              children: [
                Positioned(
                  top: 1,
                  left: 1,
                  child: Icon(
                    icon,
                    size: 20,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(
              color: Color.fromRGBO(39, 15, 191, 1),
              fontFamily: 'Inter',
              fontSize: 14,
            ),
          ),
          SizedBox(height: 5),
          Text(
            count.toString(),
            style: TextStyle(
              color: Color.fromRGBO(39, 15, 191, 1),
              fontFamily: 'Inter',
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

}
