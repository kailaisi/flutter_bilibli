import 'dart:io';

import 'package:bilibli/page/home_page.dart';
import 'package:bilibli/widget/app_bar.dart';
import 'package:bilibli/widget/video_view.dart';
import 'package:flutter/material.dart';

class VideoDetaiPage extends StatefulWidget {
  final VideoModel videoModel;
  const VideoDetaiPage({
    Key? key,
    required this.videoModel,
  }) : super(key: key);

  @override
  _VideoDetaiPageState createState() => _VideoDetaiPageState();
}

class _VideoDetaiPageState extends State<VideoDetaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MediaQuery.removePadding(
        removeTop: Platform.isIOS,
        context: context,
        child: Column(
          children: [
            if (Platform.isIOS) NavigationToolbar(),
            Text('视频详情页,'),
            VideoView(
              url: 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
              cover:
                  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20181229%2Fff6a1ecb56804798ae6c26c2fb069476.png&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1647346581&t=0691020318bd48e1a675547ffe59c464',
              overlayUi: videoBar(),
            ),
          ],
        ),
      ),
    );
  }
}
