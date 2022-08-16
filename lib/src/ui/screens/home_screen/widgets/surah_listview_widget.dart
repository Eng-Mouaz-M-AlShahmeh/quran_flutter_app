/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:quran_flutter_app/src/models/surah.dart';
import 'surah_item_widget.dart';

class SurahListViewWidget extends StatefulWidget {
  final List<Surah> surahs;
  const SurahListViewWidget({Key? key, required this.surahs}) : super(key: key);

  @override
  State<SurahListViewWidget> createState() => _SurahListViewWidgetState();
}

class _SurahListViewWidgetState extends State<SurahListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.surahs.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return SurahItemWidget(
          surah: widget.surahs[index],
        );
      },
      shrinkWrap: true,
    );
  }
}
