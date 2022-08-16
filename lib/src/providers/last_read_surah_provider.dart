/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:quran_flutter_app/src/models/surah.dart';
import 'package:quran_flutter_app/src/services/storage/last_read_surah.dart';

class LastReadSurahProvider extends ChangeNotifier {
  Surah? _surah;
  get surah => _surah;

  void updateLastReadSurah(Surah surah) {
    LastReadSurah().add(surah);
    _surah = surah;
    notifyListeners();
  }

  void getLastReadSurah() async {
    _surah = await LastReadSurah().getLastRead();
    notifyListeners();
  }
}
