import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self_love/blocs/components/constants.dart';
import 'package:video_player/video_player.dart';

class VideoInfo extends StatefulWidget {
  VideoInfo(
      {Key? key,
      required this.isSubscribed,
      required this.jsonFileLocation,
      required this.title})
      : super(key: key);
  String title;
  String jsonFileLocation;
  bool isSubscribed;
  @override
  _VideoInfoState createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfo> {
  List videoInfo = [];
  bool _playArea = false;
  VideoPlayerController? _controller;
  bool _isPlaying = true;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  String _nowPlayingText = '';
  String _nowPlayingName= '';
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString(widget.jsonFileLocation)
        .then((value) {
      setState(() {
        videoInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
    // _onTapVideo(-1);
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:  Colors.green.shade200,
          foregroundColor: kBackgroundColor,
          elevation: 2.0,
          title: Text(_nowPlayingName),
        ),
        body: Container(
          decoration: _playArea == false
              ? BoxDecoration(
                  gradient: LinearGradient(
                  colors: [kPrimaryColor.withOpacity(0.8), kBackgroundColor],
                  begin: const FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                ))
              : BoxDecoration(color: kBackgroundColor),
          child: Column(
            children: [
              _playArea == false
                  ? Container(
                      padding:
                          const EdgeInsets.only(top: 70, left: 30, right: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                                fontSize: 25, color: kBackgroundColor),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 90,
                                height: 25,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        kPrimaryColor.withOpacity(0.9),
                                        kBackgroundColor
                                      ],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.topRight,
                                    )),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.timer,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "20 min",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ))
                  : Container(
                      // width: double.infinity,
                      // height: 300,
                      // color: color.AppColor.gradientSecond,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [_playView(context), _controlView(context)],
                      ),
                    ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          _nowPlayingText,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Expanded(child: _commonList())
                  ],
                ),
              )),
            ],
          ),
        ));
  }

  ///method for showing the video
  Widget _playView(BuildContext context) {
    final controller = _controller;
    if (controller != null && controller.value.isInitialized) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: AspectRatio(aspectRatio: 16 / 9, child: VideoPlayer(controller)),
      );
    } else {
      return const AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: CircularProgressIndicator(
            color: kPrimaryColor,
          ),
        ),
      );
    }
  }

  var _onUpdateControlerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;

  /// for initializing on tap video
  _initializeVideo(int index) {
    final controller =
        VideoPlayerController.network(videoInfo[index]['videoUrl']);
    setState(() {
      _nowPlayingText = 'Now Playing: ' + videoInfo[index]['title'];
      _nowPlayingName= videoInfo[index]['title'];
    });
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});
    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {});
      });
  }

  /// for controlling the update on tap video
  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControlerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControlerTime > now) {
      return;
    }
    _onUpdateControlerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      print('controller is null');
      return;
    }
    if (controller.value.isInitialized) {
      // print('controller can not be initialized');
      return;
    }

    _duration ??= _controller?.value.duration;
    var duration = _duration;
    if (duration == null) return;

    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if (playing) {
      if (_disposed) return null;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() /
            duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying = playing;
  }

  /// for on tap video
  _onTapVideo(int index) {
    _initializeVideo(index);
  }

  /// for showing the list of videos
  _commonList() {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        itemCount: videoInfo.length,
        itemBuilder: (_, int index) {
          return InkWell(
            onTap: () {
              _onTapVideo(index);
              debugPrint(index.toString());
              setState(() {
                if (_playArea == false) {
                  _playArea = true;
                }
              });
            },
            child: _buildCards(index),
          );
        });
  }

  _buildCards(int index) {
    return Container(
      height: 125,
      // color: Colors.green.shade50,
      width: 200,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(videoInfo[index]["thumbnail"]),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: Text(
                      videoInfo[index]["time"],
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 10),
              Flexible(
                child: Row(
                  children: [
                    for (int i = 0; i < 114; i++)
                      i.isEven
                          ? Container(
                              width: 4,
                              height: 1,
                              decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(2)),
                            )
                          : Container(
                              width: 2,
                              height: 1,
                              color: Colors.white,
                            )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  /// for controlling the running video
  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume ?? 0) > 0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0);
    final secs = convertTwo(remained % 60);
    return Center(
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 5),
        color: Colors.green.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                if (noMute) {
                  _controller?.setVolume(0);
                } else {
                  _controller?.setVolume(1.0);
                }
                setState(() {});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Container(
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 4.0,
                        color: Color.fromARGB(50, 0, 0, 0))
                  ]),
                  child: Icon(
                    noMute ? Icons.volume_up : Icons.volume_off,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            FlatButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  if (index >= 0 && videoInfo.length >= 0) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar('Videos', '',
                        snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(
                          Icons.face,
                          size: 30,
                          color: Colors.white,
                        ),
                        messageText: const Text('No more videos in the list!!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)));
                  }
                },
                child: const Icon(Icons.fast_rewind,
                    size: 26, color: Colors.white)),
            FlatButton(
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 26, color: Colors.white)),
            FlatButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= videoInfo.length - 1) {
                    _initializeVideo(index);
                  } else {
                    // SnackBar(content: Text('No more videos'));
                    Get.snackbar('Videos', '',
                        backgroundColor: kPrimaryColor,
                        snackPosition: SnackPosition.BOTTOM,
                        icon: const Icon(
                          Icons.face,
                          size: 30,
                          color: Colors.white,
                        ),
                        messageText: const Text(
                            'You have finished watching all the videos. Congratulations!!',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)));
                  }
                },
                child: const Icon(Icons.fast_forward,
                    size: 26, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
