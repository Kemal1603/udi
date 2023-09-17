import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/di/data_di.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  _setupDI(flavor);

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: AppLocalization.supportedLocales,
      path: AppLocalization.langsFolderPath,
      useOnlyLangCode: true,
      fallbackLocale: AppLocalization.fallbackLocale,
      useFallbackTranslations: true,
      child: const App(),
    ),
  );
}

void _setupDI(Flavor flavor) {
  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) {
      AppDI.initDependencies(flavor);
      dataDI.initDependencies();
      setupNavigationDependencies();
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
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        localeResolutionCallback: (Locale? locale, Iterable<Locale> supported) {
          final Locale locale = context.locale;
          return locale;
        },
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
