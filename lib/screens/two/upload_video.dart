import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}


class _UploadVideoState extends State<UploadVideo> {

  XFile? selectedVideo;
  VideoPlayerController? _controller;



  /// upload video
  Future<void> _uploadVideo () async {
    final XFile? pickedVideo = await ImagePicker().pickVideo(source: ImageSource.gallery);

    if(pickedVideo != null) {

      _controller = VideoPlayerController.file(File(pickedVideo.path));

      await _controller!.initialize();
    }

    setState(() {
      selectedVideo = pickedVideo;
    });

    _controller!.play();

    _controller!.setLooping(true);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if(_controller != null) {
      _controller!.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade900.withRed(10),


      body: Center(
        child: Column(
          children: [

            /// video
            SizedBox(height: 140),

            Container(
              width: 300,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),

              child:
              _controller != null &&  _controller!.value.isInitialized
              ? ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: VideoPlayer(
                    _controller!,
                ),
              ) : null,
            ),


            SizedBox(height: 40),

            /// upload button
            GestureDetector(
              onTap: _uploadVideo,
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(child: Text(
                  "Upload Video",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
