part of core_ui;

class AppShadows {
  static const Offset _shadowOffset = Offset(0, 2);
  static const double _standartBlurRadius = 5.0;
  static const double _largeBlurRadius = 8.0;
  static const double _largeSpreadRadius = 1.0;

  static BoxShadow standart(BuildContext context) => BoxShadow(
        color: AppColors.of(context).philippineSilver.withOpacity(0.5),
        offset: _shadowOffset,
        blurRadius: _standartBlurRadius,
      );

  static BoxShadow large(BuildContext context) => BoxShadow(
        color: AppColors.of(context).philippineSilver.withOpacity(0.5),
        offset: _shadowOffset,
        blurRadius: _largeBlurRadius,
        spreadRadius: _largeSpreadRadius,
      );
}
