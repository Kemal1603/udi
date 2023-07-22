import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:navigation/app_router/app_router.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupDI(flavor);

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ru', 'RU'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const App(),
    ),
  );
}

void _setupDI(Flavor flavor) {
  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) {
      AppDI.initDependencies(flavor);
    },
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  void onChangeLocale(Locale locale) {
    context.setLocale(locale).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return LocalizationWidget(
      child: MaterialApp.router(
        locale: context.locale,
        localizationsDelegates: [
          ...context.localizationDelegates,
        ],
        supportedLocales: context.supportedLocales,
        routerDelegate: appLocator.get<AppRouter>().delegate(),
        theme: lightTheme,
        routeInformationParser: appLocator.get<AppRouter>().defaultRouteParser(),
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
      ),
      onChangeLocale,
    );
  }
}
