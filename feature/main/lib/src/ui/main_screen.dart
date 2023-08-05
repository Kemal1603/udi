import 'package:core/core.dart';
import 'package:flutter/material.dart';

@RoutePage<String>()
class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
