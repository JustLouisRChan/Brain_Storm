import 'package:flutter/material.dart';

void main() {
  runApp(const FigmaToCodeApp());
}

class FigmaToCodeApp extends StatelessWidget {
  const FigmaToCodeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: SearchPage(),
      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                20,
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 120,
                      height: 215.33,
                      margin: const EdgeInsets.all(16.0),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF2F0FD),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF270FBF)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 215.33,
                      margin: const EdgeInsets.all(16.0),
                      decoration: ShapeDecoration(
                        color: Color(0xFFF2F0FD),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFF270FBF)),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Text('My Courses'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  String _searchText = '';
  List<String> _suggestions = [
    'Search suggestion 1',
    'Search suggestion 2',
    'Search suggestion 3',
  ];

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Set the width of the search bar
      padding: const EdgeInsets.all(8.0), // Reduce the padding
      decoration: BoxDecoration(
        color: Color(0xFFF2F0FD),
        border: Border.all(color: Color(0xFF270FBF)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Set the mainAxisSize to min
        children: [
          TextField(
            focusNode: _focusNode,
            cursorColor: _isFocused ? Color(0xFF2810BF) : Color(0xFF333333),
            style: TextStyle(color: Color(0xFF333333)),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: _isFocused ? Color(0xFF2810BF) : Color(0xFFA99BFF),
              ),
              border: InputBorder.none,
              hintText: 'Search...',
              hintStyle: TextStyle(color: Color(0xFF333333)),
            ),
            onChanged: (text) {
              setState(() {
                _searchText = text;
              });
            },
          ),
          if (_isFocused && _searchText.isNotEmpty)
            Container(
              height: 80, // Set the height of the suggestions container
              child: Column(
                children: _suggestions
                    .map((suggestion) => GestureDetector(
                          onTap: () {
                            setState(() {
                              _searchText = suggestion;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                suggestion,
                                style: TextStyle(color: Color(0xFF333333)),
                              ),
                              Divider(
                                thickness: 1,
                                color: Color(0xFF270FBF),
                              ),
                            ],
                          ),
                        ))
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}
