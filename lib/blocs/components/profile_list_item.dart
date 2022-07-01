import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileListItem extends StatelessWidget {
  const ProfileListItem({Key? key,
    required this.icon,
    required this.text,
    this.hasNavigation= true
  }) : super(key: key);
  final IconData icon;
  final String text;
  final bool hasNavigation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w *5,
      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w *4).copyWith(
          bottom: kSpacingUnit.w *1.5
      ),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w *2),
      decoration: BoxDecoration(
          color: Colors.green.shade200,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        children: [
          Icon(this.icon,
              size: kSpacingUnit.w *2.5,
              color: Colors.white),
          SizedBox(width: kSpacingUnit.w *2.5),
          Text(text, style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16)) ,
          Spacer(),
          if(hasNavigation)
            Icon(Icons.arrow_right_alt,size: kSpacingUnit.w *2.5,color: Colors.white)
        ],
      ),
    );
  }
}
