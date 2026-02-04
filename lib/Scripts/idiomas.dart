import 'dart:ui';

class Idiomas {
  Locale locale = const Locale('es');
  final List<Locale> languages = const [Locale('es'), Locale('en')];
  final Map<String, String> flagImages = {
    'es': 'assets/images/colombia.png',
    'en': 'assets/images/en.png',
  };
  final Map<String, Map<String, String>> texts = {
    'es': {'title': 'Mi App', 'hello': 'Hola Mundo'},
    'en': {'title': 'My App', 'hello': 'Hello World'},
  };
  String t(String key) => texts[locale.languageCode]![key]!;
  void toggleLanguage() {
    final currentIndex = languages.indexOf(locale);
    final nextIndex = (currentIndex + 1) % languages.length;
    locale = languages[nextIndex];
  }
}

final idiomas = Idiomas();
