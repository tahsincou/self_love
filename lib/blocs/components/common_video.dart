import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CommonVideo extends StatefulWidget {
   CommonVideo({Key? key, required this.list}) : super(key: key);
   List list;
  @override
  State<CommonVideo> createState() => _CommonVideoState();
}

class _CommonVideoState extends State<CommonVideo> {
  late FlickManager flickManager;
  late CommonVideo commonVideo ;
  // var _videoUrl= list[1].urlVideo.toString();
  @override
  void initState() {
    super.initState();

    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.asset('assets/videos/water.mp4'),
    );
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FlickVideoPlayer(
                flickManager: flickManager
            ),
          ),
        ],
      ),
    );
  }
}
