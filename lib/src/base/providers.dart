/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:quran_flutter_app/src/providers/audio_player_provider.dart';
import 'package:quran_flutter_app/src/providers/bookmark_provider.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter_app/src/providers/last_read_surah_provider.dart';
import 'package:quran_flutter_app/src/providers/radio_provider.dart';
import 'package:quran_flutter_app/src/providers/theme_provider.dart';

List<ChangeNotifierProvider> providers = [
  ChangeNotifierProvider<ThemeProvider>(
    create: (_) => ThemeProvider(),
  ),
  ChangeNotifierProvider<AudioPlayerProvider>(
    create: (_) => AudioPlayerProvider(),
  ),
  ChangeNotifierProvider<BookMarkProvider>(
    create: (_) => BookMarkProvider(),
  ),
  ChangeNotifierProvider<RadioProvider>(
    create: (_) => RadioProvider(),
  ),
  ChangeNotifierProvider<LastReadSurahProvider>(
    create: (_) => LastReadSurahProvider(),
  ),
];
