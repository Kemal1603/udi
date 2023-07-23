part of core_ui;

class AppIconSvg {
  static Widget asset(
    String path, {
    double? width,
    double? height,
    BoxFit? fit,
    Color? color,
  }) =>
      SvgPicture.asset(
        path,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
      );
}

class AppIcons {
  static Icon home = const Icon(
    Icons.home,
    size: AppDimens.itemSize24,
  );

  static Icon clear = const Icon(
    Icons.cancel,
    size: AppDimens.itemSize24,
  );
}
