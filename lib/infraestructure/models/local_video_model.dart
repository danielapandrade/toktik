import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  LocalVideoModel({
    required this.caption,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  String caption;
  String videoUrl;
  int likes;
  int views;

  factory LocalVideoModel.fromJson(Map<String, dynamic> json) =>
      LocalVideoModel(
        caption: json['name'],
        videoUrl: json['videoUrl'],
        likes: json['likes'],
        views: json['views'],
      );

  VideoPost toVideoPostEntity() => VideoPost(
    caption: caption,
    videoUrl: videoUrl,
    likes: likes,
    views: views,
  );
}
