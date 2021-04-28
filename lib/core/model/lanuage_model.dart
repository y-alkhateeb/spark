import 'package:flutter/material.dart';

import '../constants/app/app_constants.dart';

class LanguageModel {
  final int languageId;
  final String languageName;
  final Locale locale;

  LanguageModel({required this.languageId,required this.languageName,required this.locale,});

  static List<LanguageModel> getLanguage() {
    return <LanguageModel>[
      LanguageModel(languageId: 0, languageName: "العربية",locale: Locale(ApplicationConstants.LANG_AR)),
      LanguageModel(languageId: 1, languageName: "English",locale: Locale(ApplicationConstants.LANG_EN)),
    ];
  }
}