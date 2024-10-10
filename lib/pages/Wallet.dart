import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_app/pages/botnav.dart';

class AndroidWalletPageWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              color: Color.fromRGBO(238, 236, 246, 1),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.08,
                      left: screenWidth * 0.04,
                      right: screenWidth * 0.04),
                  width: double.infinity,
                  height:
                      screenHeight * 0.8, // Height is 80% of the screen height
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.4),
                        offset: Offset(0, 0),
                        blurRadius: 4,
                      ),
                    ],
                    color: Color.fromRGBO(245, 245, 245, 1),
                  ),
                  child: Column(
                    children: <Widget>[
                      // Header Row with "My Wallet"
                      Container(
                        margin: EdgeInsets.only(
                            top: screenHeight * 0.04, left: screenWidth * 0.08),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Boxicons.bxs_wallet,
                              size: screenWidth * 0.06, // Responsive icon size
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                            SizedBox(width: screenWidth * 0.02),
                            Text(
                              'My Wallet',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 1),
                                fontFamily: 'Inter',
                                fontSize:
                                    screenWidth * 0.045, // Responsive font size
                                fontWeight: FontWeight.normal,
                                height: 1.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: screenHeight *
                              0.05), // Spacing between header and circle

                      // Centered Circle Container
                      Center(
                        child: Container(
                          width: screenWidth *
                              0.4, // Responsive width for the circle
                          height: screenWidth * 0.4, // Make it a circle
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                169, 155, 255, 1), // Purple background
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Total Assets',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Inter',
                                    fontSize: screenWidth *
                                        0.03, // Responsive font size
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height: screenHeight *
                                        0.01), // Adjusted spacing
                                Text(
                                  '12,021',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontFamily: 'Inter',
                                    fontSize: screenWidth *
                                        0.06, // Responsive font size
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height: screenHeight *
                                        0.005), // Adjusted spacing
                                Text(
                                  'ETH',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color.fromARGB(164, 0, 0, 0),
                                    fontFamily: 'Inter',
                                    fontSize: screenWidth *
                                        0.05, // Responsive font size
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: screenHeight *
                              0.05), // Spacing between circle and rectangles

                      // First Rectangle Container - Buy Crypto
                      InkWell(
                        onTap: () {
                          // Add your onTap functionality here
                          print('Buy Crypto clicked');
                        },
                        child: Center(
                          child: Container(
                            width: screenWidth *
                                0.6, // Rectangle width as 60% of screen width
                            height: screenHeight * 0.04, // Responsive height
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Color.fromRGBO(40, 16, 191, 0.5),
                                  width: 0.5),
                            ),
                            child: Center(
                              child: Text(
                                'Buy Crypto',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(195, 0, 0, 0),
                                  fontSize: screenWidth *
                                      0.04, // Responsive font size
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: screenHeight *
                              0.02), // Spacing between rectangles

                      // Second Rectangle Container - Sell Crypto
                      InkWell(
                        onTap: () {
                          // Add your onTap functionality here
                          print('Sell Crypto clicked');
                        },
                        child: Center(
                          child: Container(
                            width: screenWidth * 0.6,
                            height: screenHeight * 0.04, // Responsive height
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                  color: Color.fromRGBO(40, 16, 191, 0.5),
                                  width: 0.5),
                            ),
                            child: Center(
                              child: Text(
                                'Sell Crypto',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color.fromARGB(195, 0, 0, 0),
                                  fontSize: screenWidth * 0.04,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: screenHeight *
                              0.02), // Spacing between rectangles

                      // "Top Up" Button
                      InkWell(
                        onTap: () {
                          // Add your onTap functionality here
                          print('Top Up clicked');
                        },
                        child: Center(
                          child: Container(
                            width: screenWidth * 0.6, // Width of the button
                            height:
                                screenHeight * 0.054, // Height of the button
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(
                                  40, 16, 191, 1), // Purple background
                              borderRadius: BorderRadius.circular(11),
                            ),
                            child: Center(
                              child: Text(
                                'Top Up',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth *
                                      0.04, // Responsive font size
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Positioned Bottom Navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomNav(),
          ),
        ],
      ),
    );
  }
}
