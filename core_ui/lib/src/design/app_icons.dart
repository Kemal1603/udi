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
        color: color,
      );
}

class AppIcons {
  static Icon home = Icon(
    Icons.home,
    size: AppDimens.ITEM_SIZE_24,
  );

  static Icon clear = Icon(
    Icons.cancel,
    size: AppDimens.ITEM_SIZE_24,
  );
}
