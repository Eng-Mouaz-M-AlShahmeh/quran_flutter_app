/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter_app/src/models/radio.dart';
import 'package:quran_flutter_app/src/providers/radio_provider.dart';
import 'package:quran_flutter_app/src/ui/common/loading_listview.dart';
import 'package:quran_flutter_app/src/ui/screens/radio_screen/widgets/custom_toggle_widget.dart';
import 'package:quran_flutter_app/src/ui/screens/radio_screen/widgets/radio_widget.dart';
import 'package:quran_flutter_app/src/ui/screens/radio_screen/widgets/reciters_listview.dart';
import 'package:quran_flutter_app/src/utils/app_style.dart';

class RadioScreen extends StatefulWidget {
  const RadioScreen({Key? key}) : super(key: key);

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  bool isRadio = true;
  @override
  void initState() {
    super.initState();
    context.read<RadioProvider>().getLists();
  }

  @override
  Widget build(BuildContext context) {
    List<RadioModel> radiosList = context.watch<RadioProvider>().radios;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(AppStyle.padding),
          children: [
            const Text(
              'الراديو',
              style: AppStyle.titleTextStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: CustomToggleWidget(
                isRadio: isRadio,
                onPressed: () {
                  setState(() => isRadio = !isRadio);
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Visibility(
                visible: isRadio,
                child: radiosList.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (context, index) => RadioWidget(
                          radioModel: radiosList[index],
                          index: index,
                        ),
                        itemCount: radiosList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                      )
                    : const LoadingListView(),
                replacement: const RecitersListView()),
          ],
        ),
      ),
    );
  }
}
