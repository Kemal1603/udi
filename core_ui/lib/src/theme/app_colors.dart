part of core_ui;

abstract class AppColors {
  const AppColors();

  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }

  factory AppColors.withOutContext() {
    return const LightColors();
  }

  Color get white;

  Color get black;

  Color get blue;

  Color get gray;

  Color get smokeSilver;

  Color get silverGray;

  Color get darkBlue;

  Color get lightGreen;
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors extends AppColors {
  const LightColors();

  @override
  Color get black => const Color(0xff000000);

  @override
  Color get blue => const Color(0xff00B0E9);

  @override
  Color get gray => const Color(0xff969696);

  @override
  Color get smokeSilver => const Color(0xffEEEEEE);

  @override
  Color get white => const Color(0xffFFFFFF);

  @override
  Color get silverGray => const Color(0xffD2D0D0);

  @override
  Color get darkBlue => const Color(0xff0058FF);

  @override
  Color get lightGreen => const Color(0xffB2EB41);
}
