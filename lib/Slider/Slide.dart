import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Slide {
  final String url;
  // final String title;
  final String description;
  //final String icon;
  Slide({
    @required this.url,
//@required this.title,
    @required this.description,
    // @required this.icon,
  });
}

final slidelist = [
  Slide(
      url:
          'https://library.kissclipart.com/20180906/evw/kissclipart-video-camera-with-tripod-png-clipart-photographic-5f3c9c69f7c20fef.png',
      description: ' Discover your new favorite movies '),
  Slide(
      url:
          'https://www.wallpaperup.com/uploads/wallpapers/2015/12/12/858387/4b8a92b93fc6b6a5a91175fdc7692d3c-500.jpg',
      description: ' share your reviews and comments with others '),
  Slide(
    url:
        'https://images-na.ssl-images-amazon.com/images/I/71H4EDEfcwL._AC_SY741_.jpg',
    description: 'be updated with the new releases ',
  )
];
