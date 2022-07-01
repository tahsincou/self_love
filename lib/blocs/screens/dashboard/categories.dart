import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/common_video.dart';
import 'package:self_love/blocs/components/constants.dart';
import 'package:self_love/blocs/components/scrollablae_boxes.dart';
import 'package:self_love/blocs/screens/dashboard/model.dart';
import 'package:self_love/blocs/screens/dashboard/video_info.dart';

class DashboardCategoriesScreen extends StatefulWidget {
  const DashboardCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<DashboardCategoriesScreen> createState() =>
      _DashboardCategoriesScreenState();
}

class _DashboardCategoriesScreenState extends State<DashboardCategoriesScreen> {
  List<VideoItem> items = [
    VideoItem(
        title: 'one',
        urlImage: 'assets/images/motivation.jpg',
        urlVideo: 'assets/videos/water.mp4',
        desc: 'First Description',
        isLocked: true),
    VideoItem(
        title: 'second',
        urlImage: 'assets/images/rights.jpg',
        urlVideo: 'assets/videos/water.mp4',
        desc: 'Second Description',
        isLocked: true),
    VideoItem(
        title: 'third',
        urlImage: 'assets/images/freedom01.jpg',
        urlVideo: 'assets/videos/snapping.mp4',
        desc: 'Third Description',
        isLocked: true),
    VideoItem(
        title: 'fourth',
        urlImage: 'assets/images/freedom02.jpg',
        urlVideo: 'assets/videos/water.mp4',
        desc: 'Fourth Description',
        isLocked: true),
  ];

  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: kBackgroundColor,
      //   foregroundColor: kTextBaseColor,
      //   elevation: 2.0,
      // ),

      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Colors.green.shade200,
                image: DecorationImage(
                    scale: 2.5,
                    opacity: 0.6,
                    alignment: Alignment.centerRight,
                    image: AssetImage('assets/images/dove.png'))),
          ),
          SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 100),
                  child: Text('Be there for your friends',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20)),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  height: 45,
                  width: size.width * .7,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5)),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Search',
                        border: InputBorder.none),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            padding: EdgeInsets.all(10),
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: .99,
                            controller:
                                ScrollController(keepScrollOffset: false),
                            children: [
                              categories('My Affirmation',
                                  'assets/images/dove.png', '', []),
                              categories('My Favourites',
                                  'assets/images/women_v.png', '', []),
                              categories('My Collections',
                                  'assets/images/man_v.png', '', []),
                            ]),
                        sectionTitle('Popular', true, 'assets/json/videoinfo.json'),
                        ScrollableBoxes(items: items),
                        SizedBox(height: 20),
                        sectionTitle('My Favourites', false, 'assets/json/videoinfo.json'),
                        ScrollableBoxes(items: items),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    );
  }

  ClipRRect categories(String title, String imageLocation,
      String navigationLink, List argumentsData) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
        boxShadow: [BoxShadow(
          offset: Offset(0,17),
          blurRadius: 17,
          spreadRadius: -23,
          color: kBackgroundColor
        )]
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Image.asset(
                    imageLocation,
                    scale: 6.2,
                  ),
                  Spacer(),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w400, color: kTextColor),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding sectionTitle(String title, bool isSubscribed, String jsonFileLocation) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: kTextColor,
                fontSize: 17,
                fontWeight: FontWeight.w800),
          ),
          InkWell(
            child: Text('See All', style: TextStyle(fontSize: 15)),
            onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoInfo(
                                  isSubscribed: isSubscribed,
                                  jsonFileLocation:
                                  jsonFileLocation,
                              title: title,)),
                        );
            },
          ),
        ],
      ),
    );
  }
}
