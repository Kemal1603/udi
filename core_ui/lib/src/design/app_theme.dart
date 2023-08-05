part of core_ui;

const LightColors _lightColors = LightColors();

final ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: _lightColors.white,
  textTheme: _textLightTheme,
  bottomSheetTheme: BottomSheetThemeData(
    surfaceTintColor: null,
    backgroundColor: _lightColors.transparent,
    elevation: 0.0,
  ),
  iconTheme: IconThemeData(
    color: _lightColors.alizarin,
  ),
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData.dark().copyWith();

TextTheme get _textLightTheme => TextTheme(
      titleMedium: AppFonts.normal14,
      bodyMedium: AppFonts.normal14,
    ).apply(
      bodyColor: _lightColors.black,
      displayColor: _lightColors.black,
    );
