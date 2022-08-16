/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:quran_flutter_app/src/models/radio.dart';
import 'package:quran_flutter_app/src/models/reciter.dart';
import 'package:quran_flutter_app/src/services/api/radio_api.dart';

class RadioProvider extends ChangeNotifier {
  List<Reciter> reciters = [];
  List<RadioModel> radios = [];

  Future getLists() async {
    reciters = await RadioApi().getRecitersList();
    radios = await RadioApi().getRadiosList();
    notifyListeners();
  }
}
