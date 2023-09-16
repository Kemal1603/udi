import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class BaseScreen extends StatelessWidget {
  final Widget Function(BuildContext context) mobileBuilder;
  final Widget Function(BuildContext context)? tabletBuilder;
  final Widget Function(BuildContext context)? desktopBuilder;

  const BaseScreen({
    super.key,
    required this.mobileBuilder,
    this.tabletBuilder,
    this.desktopBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScreenTypeLayout.builder(
          breakpoints: const ScreenBreakpoints(
            desktop: 900,
            tablet: 650,
            watch: 250,
          ),
          mobile: mobileBuilder,
          tablet: tabletBuilder != null
              ? (BuildContext context) => tabletBuilder!(context)
              : mobileBuilder,
          desktop: desktopBuilder != null
              ? (BuildContext context) => desktopBuilder!(context)
              : mobileBuilder,
        ),
      ),
    );
  }
}
