import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_provider.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

class DiscoverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final discoverProvider = context.watch<DiscoverProvider>();
    // TODO: implement build
    return Scaffold(
      body: discoverProvider.initialLoading
          ? Center(child: CircularProgressIndicator())
          : Placeholder(child: VideoScrollableView(discoverProvider.videos),)
    );
  }
}
