/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:quran_flutter_app/src/models/ayah.dart';
import 'package:quran_flutter_app/src/services/storage/bookmark_storage.dart';

class BookMarkProvider extends ChangeNotifier {
  List<Ayah> markedAyahList = [];
  void getMarkedAyahList() async {
    List<Ayah> data = await BookMarkStorage().getAllBookMarked();
    markedAyahList = data;
    notifyListeners();
  }

  bool getMarkedAyah(String ayahTextAr) {
    bool isMarked =
        markedAyahList.any((element) => element.ayahTextAr == ayahTextAr);
    return isMarked;
  }

  void addAyahToBookMark(Ayah ayah) {
    bool isMarked =
        markedAyahList.any((element) => element.ayahTextAr == ayah.ayahTextAr);

    if (!isMarked) {
      markedAyahList.add(ayah);
      BookMarkStorage().add(ayah);
      notifyListeners();
    }
  }

  deleteMarkedAyah(Ayah ayah) {
    BookMarkStorage().delete(ayah);
    markedAyahList
        .removeWhere((element) => element.ayahTextAr == ayah.ayahTextAr);
    notifyListeners();
  }
}
