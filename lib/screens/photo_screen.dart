import 'package:FlutterGalleryApp/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:FlutterGalleryApp/res/res.dart';

import 'feed_screen.dart';

class FullScreenImage extends StatelessWidget {
  FullScreenImage(
      {Key key,
      this.photo = kFlutterDash,
      this.name = 'Kirill Adeshchenko',
      this.userName = 'kaparray',
      this.altDescription =
          'Beautiful girl in a yellow dress with a flower on her head in the summer in the forest'})
      : super(key: key);

  final String photo;
  final String name;
  final String userName;
  final String altDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(CupertinoIcons.back),
            color: AppColors.grayChateau,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          title: Text('Photo', style: AppStyles.h2Black),
          backgroundColor: AppColors.bgWhite,
          elevation: 0.0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Photo(photoLink: photo),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(children: <Widget>[
                _buildPhotoDescription(),
                _buildUserMeta(),
                SizedBox(
                  height: 15,
                ),
                _buildPhotoButtons()
              ])),
        ],
      ),
    );
  }

  Widget _buildPhotoDescription() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 15),
      child: Text(
        altDescription,
        style: AppStyles.h3.copyWith(color: AppColors.textGray),
        overflow: TextOverflow.ellipsis,
        maxLines: 3,
      ),
    );
  }

  Widget _buildUserMeta() {
    return Row(children: <Widget>[
      UserAvatar('https://skill-branch.ru/img/speakers/Adechenko.jpg'),
      SizedBox(width: 6),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(name, style: AppStyles.h1Black),
          Text('@$userName',
              style: AppStyles.h5Black.copyWith(color: AppColors.manatee))
        ],
      )
    ]);
  }

  Widget _buildPhotoButtons() {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: Axis.horizontal,
      children: <Widget>[
        Expanded(flex: 1, child: LikeButton(isLiked: false, likeCount: 2157)),
        SizedBox(width: 12),
        _buildButton('Save', () {}),
        SizedBox(width: 12),
        _buildButton('Visit', () {})
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onTap) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
            onTap: onTap,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  color: AppColors.btnBlue),
              child: Text(text,
                  style: AppStyles.h4.copyWith(color: AppColors.white)),
            )));
  }
}
