import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:self_love/blocs/components/constants.dart';
import 'package:self_love/blocs/components/profile_list_item.dart';


class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
   body: Column(
     children: [
       SizedBox(height: kSpacingUnit.w *3),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Icon(Icons.arrow_back,size: ScreenUtil().setSp(kSpacingUnit.w * 2)),
           ),
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: Icon(Icons.wb_sunny,size: ScreenUtil().setSp(kSpacingUnit.w * 2)),
           ),

         ],
       ),
       Flexible(
         child: Column(
           children: [
             Container(
               height: kSpacingUnit.w *8,
               width: kSpacingUnit.w *8,
               // margin: EdgeInsets.only(top: kSpacingUnit.w *1),
               child: Stack(
                 children: [
                   CircleAvatar(
                     radius: kSpacingUnit.w *4,
                     backgroundImage: AssetImage('assets/images/women_running.png'),
                   ),
                   Align(
                     alignment: Alignment.bottomRight,
                     child:Container(
                       height: kSpacingUnit.w *2.5,
                       width: kSpacingUnit.w *2.5,
                       decoration: BoxDecoration(
                           color: Colors.green.shade200,
                           shape: BoxShape.circle
                       ),
                       child: Icon(Icons.open_in_new,
                         color: kBackgroundColor,
                         size: ScreenUtil().setSp(kSpacingUnit.w *1.5),
                       ),
                     ),
                   ),
                 ],
               ),
             ),
             SizedBox(height: kSpacingUnit.w *2),
             Text('Tahsin Hasan', style:TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
             SizedBox(height: kSpacingUnit.w *.5),
             Text('tahsincou@gmail.com', style:TextStyle(fontWeight: FontWeight.w400,fontSize: 12)),
             SizedBox(height: kSpacingUnit.w *.6),
            Container(
              height: kSpacingUnit.w *3,
              width: kSpacingUnit.w *22,
              decoration: BoxDecoration(
                color: Colors.yellow.shade500,
                borderRadius: BorderRadius.circular(kSpacingUnit.w *3)
              ),
              child: Center(
                child: Text('Upgrade to PRO', style: TextStyle(fontSize: 15)),
              ),
            ),
             Flexible(
               child: ListView(
                 children: [
                   ProfileListItem(icon: Icons.security, text: 'Privacy'),
                   ProfileListItem(icon: Icons.history, text: 'Purchase History'),
                   ProfileListItem(icon: Icons.help, text: 'Help & Support'),
                   ProfileListItem(icon: Icons.settings, text: 'Settings'),
                   ProfileListItem(icon: Icons.insert_invitation, text: 'Invite a Friend'),
                   ProfileListItem(icon: Icons.logout, text: 'Logout', hasNavigation: false),
                 ],
               ),
             )
           ],
         ),
       ),

     ],
   ),
    );
  }
}
