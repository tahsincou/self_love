import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/bottom_navigation.dart';
import 'package:self_love/blocs/screens/auth/login.dart';
import 'package:self_love/blocs/screens/auth/sign_up.dart';
import 'package:self_love/blocs/screens/dashboard/categories.dart';
import 'package:self_love/blocs/screens/dashboard/video_info.dart';
import 'package:self_love/blocs/screens/initial/initial_five.dart';
import 'package:self_love/blocs/screens/initial/initial_four.dart';
import 'package:self_love/blocs/screens/initial/initial_one.dart';
import 'package:self_love/blocs/screens/initial/initial_six.dart';
import 'package:self_love/blocs/screens/initial/initial_three.dart';
import 'package:self_love/blocs/screens/initial/initial_two.dart';
import 'package:self_love/blocs/screens/initial/subscription_offer.dart';
import 'package:self_love/blocs/screens/playlists/common_video_player.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreenView(
        navigateRoute: InitialOne(),
        duration: 10000,
        imageSize: 130,
        colors: [ Color(0xFFA1CF8C), Color(0xFF6A922E)],
        imageSrc:'assets/images/dove.png',
        text: "Self Love  & Power",
        // textType: TextType.TyperAnimatedText,
        // textType: TextType.ScaleAnimatedText,
        textType: TextType.ColorizeAnimationText,
        textStyle: TextStyle(
          fontSize: 30.0,
        ),
        backgroundColor: Colors.white,
      ),
      routes: {
        '/initial_one':(context)=> InitialOne(),
        '/initial_two':(context)=> const InitialTwoScreen(),
        '/initial_three':(context)=> const InitialThreeScreen(),
        '/initial_four':(context)=> const InitialFourScreen(),
        '/initial_five':(context)=> const InitialFiveScreen(),
        '/initial_six':(context)=> const InitialSixScreen(),
        '/sign_in_screen':(context)=> const SignInScreen(),
        '/sign_up_screen':(context)=> const SignUpScreen(),
        '/subscription_offer':(context)=> const SubscriptionOfferScreen(),
        '/dashboard_categories':(context)=> const NavigationBarCommon(),
        '/common_video_player':(context)=>  CommonVideoPlayer(),
        // '/video_info':(context)=>  const VideoInfo(),
      },
    );
  }
}
