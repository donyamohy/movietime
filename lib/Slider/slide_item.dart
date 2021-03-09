import 'package:flutter/material.dart';
import '../Slider/Slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).padding.left) *
                0.35,
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.58,
            decoration: BoxDecoration(
              // shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(slidelist[index].url), fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          /* Text(
            "It's Movie Time",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),*/
          SizedBox(height: 10),
          Column(
            children: [
              Icon(
                Icons.favorite,
                size: 40,
                color: Colors.redAccent[700],
              ),
              SizedBox(height: 10),
              Text(
                slidelist[index].description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  //fontWeight: FontWeight.bold,
                  // color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          )
        ]);
  }
}
