import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_second_diary/controllers/lang_controller.dart';
import 'package:one_second_diary/lang/translation_service.dart';

class LanguageChooser extends StatelessWidget {
  final String title = 'language'.tr;
  final LanguageController _languageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                ),
              ),
              DropdownButton<String>(
                iconSize: MediaQuery.of(context).size.width * 0.045,
                isExpanded: false,
                isDense: false,
                value: _languageController.selectedLanguage.value,
                onChanged: (symbol) {
                  _languageController.changeLanguage = symbol;
                },
                items: TranslationService.languages.map(
                  (LanguageModel _language) {
                    return DropdownMenuItem<String>(
                      child: new Text(
                        _language.language,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ),
                      value: _language.symbol,
                    );
                  },
                ).toList(),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
