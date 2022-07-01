import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class CommonVideoPlayer extends StatefulWidget {

  @override
  _CommonVideoPlayerState createState() => _CommonVideoPlayerState();
}

class _CommonVideoPlayerState extends State<CommonVideoPlayer> {

  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
      videoPlayerController:
      VideoPlayerController.asset("assets/videos/water.mp4"),
      // VideoPlayerController.network("https://rr8---sn-fja-q5jl.googlevideo.com/videoplayback?expire=1655743251&ei=s06wYqzyIYu6gAevnabgDg&ip=173.249.57.43&id=o-ADrsHPfXLo6RU8RD74WS3DUwalvIyt-HPHuxA8p_xIiT&itag=18&source=youtube&requiressl=yes&vprv=1&mime=video%2Fmp4&gir=yes&clen=45865661&ratebypass=yes&dur=816.761&lmt=1655315730313177&fexp=24001373,24007246&c=ANDROID&txp=5538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cvprv%2Cmime%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AOq0QJ8wRgIhAK7C6YJrkrvureeEnIMs-3-om4gOmptvalL6S_-7Yip1AiEA62rs9ogkqfnV0Z64ppVUXXX17jFNBsA7LvmlL_EVnrM%3D&redirect_counter=1&rm=sn-25gks7s&req_id=75a43bb0e2da3ee&cms_redirect=yes&ipbypass=yes&mh=3i&mip=103.91.231.214&mm=31&mn=sn-fja-q5jl&ms=au&mt=1655721410&mv=m&mvi=8&pl=24&lsparams=ipbypass,mh,mip,mm,mn,ms,mv,mvi,pl&lsig=AG3C_xAwRQIhALtUr3La0bRRQnradWt5hqeBA4Xwys0O_m1ckYIzrG84AiBWGtB38Ftq82SN_KRjTfGnx2XgT69zxB3PGuMX8Y3ifg%3D%3D"),
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