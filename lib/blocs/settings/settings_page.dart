import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/bloc/language_bloc.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/bloc/language_model.dart';
import 'package:my_doctor_house_mobile_app/blocs/settings/cubit/theme_cubit.dart';
import 'package:my_doctor_house_mobile_app/presentation/widgets/text_utils/text_utils.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  final List<(String, ThemeMode)> _themes = const [
    ('Dark', ThemeMode.dark),
    ('Light', ThemeMode.light),
    ('System', ThemeMode.system),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, selectedTheme) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtils(context.read<LanguageCubit>().state.selectedLanguage!),
              ..._themes.map((e) {
                final String label = e.$1;
                final ThemeMode theme = e.$2;
                return ListTile(
                  title: TextUtils(label),
                  onTap: () => context.read<ThemeCubit>().updateTheme(theme),
                  trailing:
                      selectedTheme == theme ? const Icon(Icons.check) : null,
                );
              })
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  context
                      .read<LanguageCubit>()
                      .changeLanguage(Language.english.value.languageCode);
                },
              );
            },
          ),
          const SizedBox(height: 4),
          BlocBuilder<LanguageCubit, LanguageState>(builder: (context, state) {
            return FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: () {
                  context
                      .read<LanguageCubit>()
                      .changeLanguage(Language.arabic.value.languageCode);
                });
          }),
        ],
      ),
    );
  }
}
