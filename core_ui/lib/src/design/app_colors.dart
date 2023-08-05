part of core_ui;

abstract class AppColors {
  const AppColors();

  factory AppColors.of(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? const LightColors() : const DarkColors();
  }

  factory AppColors.withOutContext() {
    return LightColors();
  }

  // static AppColors ofGlobalContext() {
  //   final BuildContext context =
  //       appLocator.get<AppRouter>().navigatorKey.currentContext!;
  //   return AppColors.of(context);
  // }

  Color get white;

  Color get black;

  Color get matterhorn;

  Color get alizarin;

  Color get alizarin5;

  Color get alizarin10;

  Color get alizarin50;

  Color get alizarin80;

  Color get transparent;

  Color get snow;

  Color get gray;

  Color get gainsboroLight;

  Color get whiteNeutral;

  Color get red;

  Color get green;

  Color get blue;

  Color get yellow;

  Color get pigment;

  Color get textGrey;

  Color get flashWhite;

  Color get philippineSilver;

  Color get whiteSmoke;

  Color get nightBlue5;

  Color get melon;

  Color get tableGray;

  Color get skyBlue;

  Color get zambezi;

  Color get darkGray;

  Color get whiteSmokeLight;

  Color get ghostWhite;

  Color get alizarinHovered;

  Color get lavender;

  Color get brandeisBlue;

  Color get mistyRose;
}

class DarkColors extends LightColors {
  const DarkColors();
}

class LightColors extends AppColors {
  const LightColors();

  @override
  Color get white => Colors.white;

  @override
  Color get flashWhite => Color(0xfff2f2f2);

  @override
  Color get pigment => Color(0xff3126A6);

  @override
  Color get black => Color(0xff000000);

  @override
  Color get matterhorn => Color(0xff545454);

  @override
  Color get alizarin => Color(0xff3F31EB);

  @override
  Color get alizarin5 => Color(0xff3F31EB).withOpacity(0.05);

  @override
  Color get alizarin10 => const Color.fromRGBO(0, 176, 233, 1);

  @override
  Color get alizarin50 => Color(0xff3F31EB).withOpacity(0.5);

  @override
  Color get alizarin80 => Color(0xff3F31EB).withOpacity(0.8);

  @override
  Color get alizarinHovered => Color(0xff1f2eaf);

  @override
  Color get whiteNeutral => Color(0xffFBFBFB);

  @override
  Color get transparent => Colors.transparent;

  @override
  Color get snow => Color(0xffF9F9F9);

  @override
  Color get gray => Color(0xff939393);

  @override
  Color get gainsboroLight => Color(0xffDFDFDF);

  @override
  Color get red => Color(0xffD83030);

  @override
  Color get melon => Color(0xfffbb9ba);

  @override
  Color get green => Color(0xff138947);

  @override
  Color get blue => Color(0xff204d9c);

  @override
  Color get yellow => Color(0xffF99D33);

  @override
  Color get textGrey => Color(0xff3b3b3b);

  @override
  Color get philippineSilver => Color(0xffB6B6B6);

  @override
  Color get whiteSmoke => Color(0xffF6F6F6);

  @override
  Color get nightBlue5 => Color(0xff4355FA).withOpacity(0.05);

  @override
  Color get tableGray => Color(0xffe6e6e6);

  @override
  Color get skyBlue => Color(0xfff6f6fd);

  @override
  Color get zambezi => Color(0xff585858);

  @override
  Color get darkGray => Color(0xffA9A9A9);

  @override
  Color get whiteSmokeLight => Color(0xffF4F4F4);

  @override
  Color get ghostWhite => Color(0xffF7F7FE);

  @override
  Color get lavender => Color(0xffdfeefe);

  @override
  Color get brandeisBlue => Color(0xff0060F7);

  @override
  Color get mistyRose => Color(0xffECEAFD);
}
