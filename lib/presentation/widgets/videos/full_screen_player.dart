import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  const FullScreenPlayer({
    super.key,
    required this.caption,
    required this.videoUrl,
  });

  final String caption;
  final String videoUrl;
  @override
  State<StatefulWidget> createState() => _FullScreenPlayer();
}

class _FullScreenPlayer extends State<FullScreenPlayer> {
  late VideoPlayerController videoPlayController;

  @override
  void initState() {
    videoPlayController = VideoPlayerController.asset(widget.videoUrl)
      ..setVolume(0)
      ..setLooping(true)
      ..play();

    super.initState();
  }

  @override
  void dispose() {
    videoPlayController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FutureBuilder(
      future: videoPlayController.initialize(),
      builder: (context, snapshot) {
        return videoPlayController.value.isInitialized
            ? AspectRatio(
                aspectRatio: videoPlayController.value.aspectRatio,
                child: VideoPlayer(videoPlayController),
              )
            : Column();
      },
    );
  }
}
