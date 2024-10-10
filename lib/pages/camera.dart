import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _controller;
  late Future<void> _initializeControllerFuture;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    super.initState();
    _initializeCameras();
  }

  Future<void> _initializeCameras() async {
    try {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      _controller = CameraController(cameras!.first, ResolutionPreset.high);
      _initializeControllerFuture = _controller!.initialize();
    } else {
      _initializeControllerFuture = Future.error('No cameras available');
    }
  } catch (e) {
    _initializeControllerFuture = Future.error('Error initializing camera: $e');
  }
  setState(() {});}

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            width: screenWidth,
            height: screenHeight,
            child: Stack(
              children: <Widget>[
                // Check if _controller is null before accessing it
                if (_controller != null)
                  CameraPreview(_controller!)
                else
                  Center(child: Text('Camera not available')),
                Positioned(
                  top: screenHeight * 0.88,
                  left: screenWidth * 0.15,
                  child: Container(
                    width: screenWidth * 0.75,
                    height: screenHeight * 0.11,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _buildIconButton(
                          Boxicons.bx_coffee,
                          'Effects',
                        ),
                        _buildIconButton(
                          Boxicons.bx_crosshair,
                          "",
                        ),
                        _buildIconButton(
                          Boxicons.bx_box,
                          'Gallery',
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: screenHeight * 0.03,
                  left: 0,
                  child: _buildActionButtons(),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildIconButton(IconData icon, String label, {double size = 50}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 0),
                blurRadius: 4,
              ),
            ],
            borderRadius: BorderRadius.circular(size / 2),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 30,
              color: Color.fromRGBO(86, 63, 232, 1),
            ),
          ),
        ),
        if (label.isNotEmpty) ...[
          SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(51, 51, 51, 1),
              fontFamily: 'Inter',
              fontSize: 10,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildActionButtons() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildIconButton(Boxicons.bx_x_circle, '', size: 30),
          _buildActionButton('Add Sound'),
          _buildIconButton(Boxicons.bx_repost, '', size: 30),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: <Widget>[
          Icon(
            Boxicons.bx_music,
            size: 20,
            color: Color.fromRGBO(86, 63, 232, 1),
          ),
          SizedBox(width: 10),
          Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(86, 62, 231, 1),
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
