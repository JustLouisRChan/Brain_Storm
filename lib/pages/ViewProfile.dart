import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProfileHeader(),
                ProfileContent(),
              ],
            ),
          ),
        ),
        ProfileFooter(),
      ],
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: Color(0xFFEEECF6)),
      child: Container(
        width: double.infinity,
        height: 350, // Adjusted height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0x66000000),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ProfileInfo(),
        ),
      ),
    );
  }
}

class ProfileContent extends StatefulWidget {
  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  Color _appliedColor = Color(0xFF270FBF);
  Color _mathColor = Color(0xFF270FBF);
  Color _premiumColor = Color(0xFF808080); // Initial color for Premium button
  bool _isPremiumButtonLocked = true;

  void _changeColor(String button) {
    setState(() {
      if (button == 'Applied') {
        _appliedColor = Color(0xFFA99BFF);
        _mathColor = Color(0xFF270FBF);
        _premiumColor = Color(0xFF808080);
      } else if (button == 'Math') {
        _appliedColor = Color(0xFF270FBF);
        _mathColor = Color(0xFFA99BFF);
        _premiumColor = Color(0xFF808080);
      }
    });
  }

  void _showPremiumPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Premium Membership"),
          content: Text("You are not a premium member."),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF563FE8),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF563FE8),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetPremiumPage()),
                );
              },
              child: Text("Get Premium"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: Color(0xFFEEECF6)),
      child: Container(
        width: double.infinity,
        height: 200, // Adjusted height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0x66000000),
              blurRadius: 4,
              offset: Offset(0, 0),
              spreadRadius: 0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _changeColor('Applied');
                  },
                  child: Text('Applied'),
                  style: ElevatedButton.styleFrom(
                    primary: _appliedColor,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 16), // Add space between buttons
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    _changeColor('Math');
                  },
                  child: Text('Math'),
                  style: ElevatedButton.styleFrom(
                    primary: _mathColor,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 16), // Add space between buttons
              Expanded(
                child: ElevatedButton(
                  onPressed: _isPremiumButtonLocked ? _showPremiumPopup : null,
                  child: Text('Premium'),
                  style: ElevatedButton.styleFrom(
                    primary: _premiumColor,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(color: Colors.transparent),
      child: Container(
        width: double.infinity,
        height: 60, // Adjusted height
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeButton(),
              MyCoursesButton(),
              InboxButton(),
              ProfileButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 215.33,
      decoration: BoxDecoration(
        color: Color(0xFFF2F0FD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xFF270FBF)),
      ),
    );
  }
}

class ProfileInfo extends StatefulWidget {
  @override
  _ProfileInfoState createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  int friendsCount = 0;
  bool isFriend = false;

  void addFriend() {
    setState(() {
      friendsCount++;
      isFriend = true;
    });
  }

  void unfriend() {
    setState(() {
      if (friendsCount > 0) {
        friendsCount--;
        isFriend = false;
      }
    });
  }

  void sendMessage() {
    // Add your logic here to send a message
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Name PlaceHolder',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 63,
          height: 63,
          decoration: BoxDecoration(
            color: Color(0xFFA99BFF),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '@',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '@Name PlaceHolder',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF333333),
            fontSize: 16,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 16),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Friends: $friendsCount',
                  style: TextStyle(
                    color: Color(0xFF333333),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                isFriend
                    ? ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFA99BFF),
                        ),
                        onPressed: unfriend,
                        child: Text('Unfriend'),
                      )
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF270FBF),
                        ),
                        onPressed: addFriend,
                        child: Text('Add Friend'),
                      ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF270FBF),
                  ),
                  onPressed: sendMessage,
                  child: Text('Message'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PremiumButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: Color(0xFF563FE8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          'Premium',
          style: TextStyle(
            color: Color(0xFFFCFAFA),
            fontSize: 8.50,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class MathButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: Color(0xFFA99BFF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          'Math Dis...',
          style: TextStyle(
            color: Color(0xFFFCFAFA),
            fontSize: 8.50,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class AppliedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 25,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      decoration: BoxDecoration(
        color: Color(0xFF563FE8),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          'Applied Phy..',
          style: TextStyle(
            color: Color(0xFFFCFAFA),
            fontSize: 8.50,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class HomeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Boxicons.bx_home,
          size: 20,
          color: Colors.black,
        ),
        const SizedBox(height: 5),
        Text(
          'Home',
          style: TextStyle(
            color: Color(0xFFA99BFF),
            fontSize: 7,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class MyCoursesButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Boxicons.bx_book,
          size: 20,
          color: Colors.black,
        ),
        const SizedBox(height: 5),
        Text(
          'My Courses',
          style: TextStyle(
            color: Colors.black,
            fontSize: 7,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class InboxButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Boxicons.bx_envelope,
          size: 20,
          color: Colors.black,
        ),
        const SizedBox(height: 5),
        Text(
          'Inbox',
          style: TextStyle(
            color: Colors.black,
            fontSize: 7,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class ProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Boxicons.bxs_user,
          size: 20,
          color: Colors.black,
        ),
        const SizedBox(height: 5),
        Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 7,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class GetPremiumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Premium"),
      ),
      body: Center(
        child: Text("This is the Get Premium page."),
      ),
    );
  }
}
