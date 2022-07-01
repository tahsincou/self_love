import 'package:flutter/material.dart';
import 'package:self_love/blocs/components/constants.dart';
import 'package:self_love/blocs/screens/dashboard/model.dart';

class ScrollableBoxes extends StatefulWidget {
  ScrollableBoxes({Key? key, required this.items}) : super(key: key);
  List<dynamic> items = [];
  @override
  State<ScrollableBoxes> createState() => _ScrollableBoxesState();
}

class _ScrollableBoxesState extends State<ScrollableBoxes> {
  bool isLocked = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        padding: EdgeInsets.all(8),
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        separatorBuilder: (context, _) => SizedBox(width: 10),
        itemBuilder: (context, index) => Stack(
          alignment: Alignment.topRight,
          children: <Widget>[
            SizedBox(
              height: 90,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(widget.items[index].urlImage,
                      fit: BoxFit.fitHeight)),
            ),
            // Expanded(child: Text(widget.items[index].title,
            //     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)) ),

            InkWell(
              onTap: () {
                setState(() {
                  if (isLocked == true) {
                    isLocked = false;
                  } else {
                    isLocked = true;
                  }
                });
              },
              child: Icon(isLocked ? Icons.lock : Icons.play_arrow,
                  size: 17,
                  color: isLocked ? Colors.red.shade300 : Colors.green),
            ),
          ],
        ),
        // itemBuilder: (context, index) => Container(
        //   width: 100,
        //   height: 100,
        //   child: Column(
        //     children: [
        //       Expanded(
        //           child: AspectRatio(
        //         aspectRatio: 4 / 3,
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(16),
        //           child: Material(
        //             child: Ink.image(
        //               image: AssetImage(widget.items[index].urlImage),
        //               fit: BoxFit.cover,
        //               child: InkWell(
        //                 onTap: (){},
        //               ),
        //             ),
        //           ),
        //         ),
        //       )),
        //       const SizedBox(height: 4),
        //       Text(widget.items[index].title,
        //           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
