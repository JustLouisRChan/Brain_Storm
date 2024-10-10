import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget opening_logo = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "BRAIN",
            style: TextStyle(
              color: Color(0xff2A1A8E),
              decoration: TextDecoration.none,
            ),
          ),
          Icon(
            Boxicons.bx_cloud_lightning,
            size: 140,
            color: Color.fromRGBO(86, 63, 232, 1),
          ),
          Text(
            "STORM",
            style: TextStyle(
              color: Color(0xff2A1A8E),
              decoration: TextDecoration.none,
            ),
          )
        ],
      ),
    );

    return opening_logo;
  }
}
