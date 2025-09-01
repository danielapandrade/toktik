import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';


class VideoButton extends StatelessWidget {


  VideoButton({super.key, required this.videoPost, this.callback});

  void Function()? callback;
  final VideoPost videoPost;

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    return Column(
      children: [
        _CustomIconButton(
          iconData: Icons.favorite,
          value: videoPost.likes,
          iconColor: Colors.red,
          callback: () {
            discoverProvider.darLike(videoPost);
          },
        ),
        _CustomIconButton(
          iconData: Icons.remove_red_eye_outlined,
          value: videoPost.views,
        ),
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  _CustomIconButton({
    this.callback,
    required this.iconData,
    required this.value,
    Color? iconColor,
  }) : color = iconColor ?? Colors.white;

  final IconData iconData;
  final Color? color;
  final int value;

  void Function()? callback;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: callback,
          icon: Icon(iconData, color: color),
        ),
        Text('$value'),
      ],
    );
  }
}
