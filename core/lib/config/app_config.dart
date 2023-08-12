enum Flavor {
  stage,
  dev,
}

class AppConfig {
  final Flavor flavor;
  final String baseUrl;
  final String webSocketUrl;

  AppConfig({
    required this.flavor,
    required this.baseUrl,
    required this.webSocketUrl,
  });

  factory AppConfig.fromFlavor(Flavor flavor) {
    String baseUrl;
    String webSocketUrl;
    switch (flavor) {
      case Flavor.stage:
        baseUrl = 'http://stage.7ft.by:8000/v1';
        webSocketUrl = '';
        break;

      case Flavor.dev:
        baseUrl = 'http://stage.7ft.by:8000/v1';
        webSocketUrl = '';
        break;
    }

    return AppConfig(
      flavor: flavor,
      baseUrl: baseUrl,
      webSocketUrl: webSocketUrl,
    );
  }
}
