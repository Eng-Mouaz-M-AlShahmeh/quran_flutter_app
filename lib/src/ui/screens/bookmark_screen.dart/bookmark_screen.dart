/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter_app/src/models/ayah.dart';
import 'package:quran_flutter_app/src/providers/bookmark_provider.dart';
import 'package:quran_flutter_app/src/ui/common/loading_listview.dart';
import 'package:quran_flutter_app/src/ui/screens/surah_screen/widgets/ayah_item_widget.dart';
import 'package:quran_flutter_app/src/utils/app_style.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({Key? key}) : super(key: key);

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  void initState() {
    context.read<BookMarkProvider>().getMarkedAyahList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Ayah> marekdAyahList =
        context.watch<BookMarkProvider>().markedAyahList;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            AppStyle.padding,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'الفواصل',
                style: AppStyle.titleTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              marekdAyahList.isNotEmpty
                  ? ListView.builder(
                      itemCount: marekdAyahList.length,
                      itemBuilder: (context, index) => AyahItemWidget(
                        ayah: marekdAyahList[index],
                        index: index,
                        showAyahNumber: false,
                      ),
                      shrinkWrap: true,
                    )
                  : const LoadingListView()
            ],
          ),
        ),
      ),
    );
  }
}
