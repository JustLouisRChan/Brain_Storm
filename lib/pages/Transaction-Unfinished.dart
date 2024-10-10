import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

class AndroidTransactionPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromRGBO(238, 236, 246, 1),
        ),
        child: Column(
          children: <Widget>[
            Spacer(flex: 1),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.9,
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
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 15),
                    child: Row(
                      children: <Widget>[
                        Icon(Boxicons.bx_arrow_back, size: 20, color: Color.fromARGB(255, 0, 0, 0)),
                        SizedBox(width: 10),
                        Text(
                          'Transaction Summary',
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 310,
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromRGBO(86, 63, 232, 1), width: 1),
                      color: Color.fromRGBO(236, 234, 245, 1),
                    ),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Rp. 10,000',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Transfer to : JustRice',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Name : FreedWasCooking',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Public ID : 0912334285',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 15), // Add space from the left side
                      Text(
                        'Transact from',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                  Container(
                    width: 310,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Color.fromRGBO(86, 63, 232, 1), width: 1),
                      color: Color.fromRGBO(236, 234, 245, 1),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Boxicons.bx_wallet,
                          size: 40,
                          color: Colors.black,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Metamask (****)',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 310,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromRGBO(86, 63, 232, 1),
                    ),
                    child: Center(
                      child: Text(
                        'Top Up',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(flex: 1),
          ],
        ),
 ),
    );
  }
}
