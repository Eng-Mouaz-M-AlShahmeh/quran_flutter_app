/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter_app/src/models/ayah.dart';
import 'package:quran_flutter_app/src/providers/theme_provider.dart';
import 'package:quran_flutter_app/src/ui/screens/surah_screen/widgets/bookmark_button.dart';
import 'package:quran_flutter_app/src/ui/screens/surah_screen/widgets/copy_button.dart';
import 'package:quran_flutter_app/src/ui/common/play_button.dart';
import 'package:quran_flutter_app/src/utils/app_style.dart';

class AyahItemWidget extends StatefulWidget {
  final Ayah ayah;
  final int index;
  final bool showAyahNumber;

  const AyahItemWidget(
      {Key? key,
      required this.ayah,
      required this.index,
      required this.showAyahNumber})
      : super(key: key);

  @override
  State<AyahItemWidget> createState() => _AyahItemWidgetState();
}

class _AyahItemWidgetState extends State<AyahItemWidget> {
  @override
  Widget build(BuildContext context) {
    var themeProv = context.read<ThemeProvider>().isDark;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppStyle.padding / 2),
      padding: const EdgeInsets.all(AppStyle.padding / 2),
      decoration: BoxDecoration(
        color: themeProv ? AppStyle.darkColor2 : AppStyle.whiteColor,
        boxShadow: AppStyle.shadow,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  widget.showAyahNumber
                      ? Container(
                          width: 33,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppStyle.secondaryColor,
                          ),
                          child: Center(
                            child: Text(
                              '${widget.ayah.number}',
                              style: const TextStyle(
                                  color: AppStyle.whiteColor, fontSize: 16),
                            ),
                          ),
                        )
                      : Container(),
                  widget.ayah.sajda
                      ? IconButton(
                          icon: const Icon(
                            Icons.explore_outlined,
                            color: Colors.amber,
                            size: 30,
                          ),
                          onPressed: () {},
                        )
                      : Container(),
                  const Spacer(),
                  CopyButton(ayah: widget.ayah),
                  PlayButton(index: widget.index, url: widget.ayah.audio),
                  BookMarkButtonWidget(ayah: widget.ayah),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.ayah.ayahTextAr,
                    textDirection: TextDirection.rtl,
                    style: AppStyle.ayahTextStyle
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.ayah.ayahTextEn,
                    textDirection: TextDirection.ltr,
                    style: AppStyle.ayahTextStyle.copyWith(
                      color: const Color.fromARGB(255, 159, 159, 159),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
