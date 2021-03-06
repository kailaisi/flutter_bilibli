import 'package:bilibli/util/view_util.dart';
import 'package:bilibli/widget/video_controller.dart';
import 'package:chewie/chewie.dart' hide MaterialControls;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orientation/orientation.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final String url;
  final String cover;
  final bool autoPlay;
  final bool looping;
  final double aspectRatio;
  final Widget? overlayUi;
  const VideoView({
    Key? key,
    required this.url,
    required this.cover,
    this.autoPlay = false,
    this.looping = false,
    this.aspectRatio = 16 / 9,
    this.overlayUi = null,
  }) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  get _placeHolder => FractionallySizedBox(
        widthFactor: 1,
        child: Image.network(widget.cover),
      );
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: widget.autoPlay,
      looping: widget.looping,
      placeholder: _placeHolder,
      customControls: MaterialControls(
        showLoadingOnInitialize: false,
        showBigPlayIcon: false,
        overlayUI: widget.overlayUi,
        bottomGradient: blackLinearGradint(),
      ),
    );
    _videoPlayerController.addListener(_fullScreenListener);
  }

  @override
  void dispose() {
    _videoPlayerController.removeListener(_fullScreenListener);
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = width / widget.aspectRatio;
    return Container(
      width: width,
      height: height,
      child: Chewie(controller: _chewieController),
    );
  }

  void _fullScreenListener() {
    final size = MediaQuery.of(context).size;
    if (size.width > size.height) {
      OrientationPlugin.forceOrientation(DeviceOrientation.portraitUp);
    }
  }
}
