import 'package:flutter/material.dart';

import '../../core_ui.dart';

class ImageSlider extends StatefulWidget {
  final double? width;
  final double? height;
  final List<String> imageUrls;

  const ImageSlider({
    required this.imageUrls,
    this.width,
    this.height,
    super.key,
  });

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController(viewportFraction: 1.0);
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _currentPageNotifier.value = _pageController.page!.round();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          width: widget.width,
          height: widget.height,
          child: PageView(
            controller: _pageController,
            physics: const PageScrollPhysics(),
            children: widget.imageUrls.map((String image) => CarImage(imageUrl: image)).toList(),
          ),
        ),
        const SizedBox(height: AppDimens.PADDING_10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ...List<Widget>.generate(
                widget.imageUrls.length,
                (int index) => ValueListenableBuilder<int>(
                    valueListenable: _currentPageNotifier,
                    builder: (BuildContext context, int value, Widget? child) {
                      return Container(
                        width: 10,
                        height: 10,
                        margin: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_1),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: value == index
                              ? AppColors.of(context).brandeisBlue
                              : AppColors.of(context).whiteSmoke,
                        ),
                      );
                    })),
          ],
        ),
      ],
    );
  }
}
