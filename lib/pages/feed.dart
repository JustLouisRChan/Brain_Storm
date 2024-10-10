import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FeedWidget(),
    );
  }
}

class Video {
  String id;
  String videoUrl;
  int likes;
  int comments;
  int saves;

  Video({
    required this.id,
    required this.videoUrl,
    this.likes = 0,
    this.comments = 0,
    this.saves = 0,
  });

  factory Video.fromFirestore(Map<String, dynamic> data) {
    return Video(
      id: data['id'],
      videoUrl: data['videoUrl'],
      likes: data['likes'] ?? 0,
      comments: data['comments'] ?? 0,
      saves: data['saves'] ?? 0,
    );
  }
}

class FeedWidget extends StatefulWidget {
  @override
  _FeedWidgetState createState() => _FeedWidgetState();
}

class _FeedWidgetState extends State<FeedWidget> {
  final String hintText = 'Search...'; // Default hint text
  List<Video> videos = [];

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    final QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('videos').get();
    setState(() {
      videos = snapshot.docs
          .map((doc) => Video.fromFirestore(doc.data() as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(color: Color.fromRGBO(51, 51, 51, 1)),
        child: Stack(
          children: <Widget>[
            _buildVideoList(),
            Positioned(
              top: screenSize.height * 0.8, // Adjusting user info position
              left: screenSize.width * 0.05,
              child: _buildUserInfo(),
            ),
            Positioned(
              bottom: screenSize.height * 0.1, // Adjusting stats position
              right: screenSize.width * 0.05,
              child: _buildStats(videos[0]),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: _buildBottomNavigation(),
            ),
            Positioned(
              top: 3, // Adjust the position of the search bar
              left: 0,
              right: 0,
              child: _buildSearchBar(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoList() {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return _buildVideoItem(video);
      },
    );
  }

  Widget _buildVideoItem(Video video) {
    return Column(
      children: [
        // Placeholder for video player; replace with actual video player widget
        Container(
          height: 200,
          color: Colors.black,
          child: Center(child: Text('Video Player Placeholder')),
        ),
        _buildStats(video), // Pass the video object here
      ],
    );
  }

  Widget _buildStats(Video video) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStatIcon(Boxicons.bx_heart, video.likes.toString()),
        _buildStatIcon(
            Boxicons.bx_message_rounded_dots, video.comments.toString()),
        _buildStatIcon(Boxicons.bx_bookmark, video.saves.toString()),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildUserProfile(),
        SizedBox(height: 10),
        _buildOriginalSoundText(),
      ],
    );
  }

  Widget _buildUserProfile() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildProfileIcon(),
        SizedBox(width: 5),
        _buildUsername(),
        SizedBox(width: 15),
        _buildFollowButton(),
      ],
    );
  }

  Widget _buildProfileIcon() {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 1),
        borderRadius: BorderRadius.circular(22),
      ),
    );
  }

  Widget _buildUsername() {
    return Text(
      'USERNAME',
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'Inter',
        fontSize: 10,
        height: 1.6,
      ),
    );
  }

  Widget _buildFollowButton() {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 10), // Added padding for better tap area
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 0.5),
      ),
      child: Center(
        child: Text(
          'Follow',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 8,
            height: 2,
          ),
        ),
      ),
    );
  }

  Widget _buildOriginalSoundText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Boxicons.bx_music, color: Colors.white, size: 16),
        SizedBox(width: 10),
        Text(
          'Original Sound',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildNavItem(Boxicons.bx_home, 'Home'),
          _buildNavItem(Boxicons.bx_book, 'My Courses'),
          _buildNavItem(Boxicons.bx_message, 'Inbox'),
          _buildNavItem(Boxicons.bx_user, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(icon, color: Color.fromRGBO(86, 63, 232, 1)),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 7,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Container(
            height: 50, // Fixed height for the scrollable container
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 4), // Space between items
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Item ${index + 1}',
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 6),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatIcon(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, color: Colors.white),
        SizedBox(width: 7),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}
