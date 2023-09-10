import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import 'car_image.dart';

class ItemWidget extends StatelessWidget {
  final AdvertModel advertItem;

  const ItemWidget({
    required this.advertItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_20),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '${advertItem.brandName} ${advertItem.modelName}, ${advertItem.generationName}',
                style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.PADDING_15),
          SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.aspectRatio * 500,
            child: PageView(
              physics: const PageScrollPhysics(),
              children:
                  advertItem.imageUrls.map((String image) => CarImage(imageUrl: image)).toList(),
            ),
          ),
          const SizedBox(height: AppDimens.PADDING_15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: Text(
                  advertItem.price.toString(),
                  style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                ),
              ),
              Flexible(
                child: Text(
                  advertItem.dateOfIssue,
                  style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                ),
              ),
              Flexible(
                child: Text(
                  advertItem.millage.toString(),
                  style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                ),
              ),
              Flexible(
                child: Text(
                  advertItem.countryCode,
                  style: AppFonts.normal13.copyWith(color: AppColors.of(context).textColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.PADDING_15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chip(
                label: const Text('Chip 1'),
                labelStyle: const TextStyle(fontSize: 12),
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Chip(
                label: const Text('Chip 2'),
                labelStyle: const TextStyle(fontSize: 12),
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Chip(
                label: const Text('Chip 3'),
                labelStyle: const TextStyle(fontSize: 12),
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
