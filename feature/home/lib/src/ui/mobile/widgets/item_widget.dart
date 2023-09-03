import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'car_image.dart';

class ItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_20),
      child: Column(
        children: <Widget>[
          const Row(
            children: [
              Text(
                "Car Name",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimens.PADDING_15),
          SizedBox(
            width: 335,
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const <Widget>[
                CarImage(imageUrl: 'https://picsum.photos/250?image=9'),
                CarImage(imageUrl: 'https://picsum.photos/250?image=9'),
                CarImage(imageUrl: 'https://picsum.photos/250?image=9'),
              ],
            ),
          ),
          const SizedBox(height: AppDimens.PADDING_15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(
                child: Text(
                  "Text 1",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "Text 2",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "Text 3",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  "Text 4",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
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
