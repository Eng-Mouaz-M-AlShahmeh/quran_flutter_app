/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter_app/src/models/radio.dart';
import 'package:quran_flutter_app/src/providers/theme_provider.dart';
import 'package:quran_flutter_app/src/ui/common/play_button.dart';
import 'package:quran_flutter_app/src/utils/app_style.dart';

class RadioWidget extends StatelessWidget {
  final int index;
  final RadioModel radioModel;
  const RadioWidget({Key? key, required this.radioModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = context.read<ThemeProvider>().isDark
        ? AppStyle.darkColor2
        : AppStyle.whiteColor;
    return Container(
      decoration: BoxDecoration(
          color: color,
          boxShadow: AppStyle.shadow,
          borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 4,
        ),
        leading: PlayButton(
          index: index,
          url: radioModel.url,
        ),
        title: Text(
          radioModel.name,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
