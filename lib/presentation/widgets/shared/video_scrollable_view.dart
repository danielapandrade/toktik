import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_button.dart';

class VideoScrollableView extends StatelessWidget {
  VideoScrollableView(this.videos);
  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: videos.length,
      onPageChanged: (int index) {
        discoverProvider.darView(videos[index]);
        print('object');
      },
      //physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Stack(
          children: [
            //video + gradiente
            //botoes
            Positioned(
              bottom: 30,
              right: 30,
              child: VideoButton(
                videoPost: videos[index],
              ),
            ),
          ],
        );
      },
    );
  }
}
