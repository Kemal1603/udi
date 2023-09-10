extension EmailValidator on String {
  bool isSvg() => endsWith('.svg');

  bool isNetworkImage() => startsWith('http');
}
