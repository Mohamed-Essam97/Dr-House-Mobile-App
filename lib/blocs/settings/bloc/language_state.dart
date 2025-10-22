part of 'language_bloc.dart';

class LanguageState extends Equatable {
  final Map<String, String> translations;
  final String? locale;
  final String? selectedLanguage;

  const LanguageState({
    required this.translations,
    this.locale,
    this.selectedLanguage,
  });

  @override
  List<Object> get props => [translations, selectedLanguage ?? 'en'];

  @override
  bool get stringify => selectedLanguage?.isEmpty ?? false;

  LanguageState copyWith({String? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
      translations: translations,
      locale: locale,
    );
  }
}
