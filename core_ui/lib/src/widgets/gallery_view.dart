import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_ui/core_ui.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class AppGalleryWidget extends StatelessWidget {
  final List<String> imageUrls;
  const AppGalleryWidget({
    required this.imageUrls,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showImageViewerPager(
          context,
          MultiImageProvider(imageUrls.map(CachedNetworkImageProvider.new).toList()),
          onPageChanged: (int page) {
            print("page changed to $page");
          },
          onViewerDismissed: (page) {
            print("dismissed while on page $page");
          },
          useSafeArea: true,
          doubleTapZoomable: true,
        );
      },
      child: ImageSlider(
        width: MediaQuery.of(context).size.width - 40,
        height: MediaQuery.of(context).size.aspectRatio * 500,
        imageUrls: imageUrls,
      ),
    );
  }
}
