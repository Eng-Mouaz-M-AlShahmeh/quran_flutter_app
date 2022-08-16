/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:quran_flutter_app/src/providers/theme_provider.dart';
import 'package:quran_flutter_app/src/services/local_notifications_service.dart';
import 'package:quran_flutter_app/src/ui/common/navbar.dart';
import 'package:quran_flutter_app/src/ui/screens/error_screen.dart';
import 'src/base/providers.dart';
import 'src/utils/app_style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotificationService().init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool hasInternet = false;
  @override
  void initState() {
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none ||
          result == ConnectivityResult.bluetooth) {
        setState(() => hasInternet = false);
      } else {
        setState(() => hasInternet = true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: Consumer(builder: (context, ThemeProvider theme, widget) {
        return MaterialApp(
          locale: const Locale('ar', 'SA'),
          supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          title: 'القرآن الكريم',
          themeMode: theme.isDark ? ThemeMode.dark : ThemeMode.light,
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          home: hasInternet
              ? const NavigationBarWidget()
              : ErrorScreen(onPressed: () async {
                  ConnectivityResult result =
                      await (Connectivity().checkConnectivity());
                  if (result == ConnectivityResult.none ||
                      result == ConnectivityResult.bluetooth) {
                    setState(() => hasInternet = false);
                  } else {
                    setState(() => hasInternet = true);
                  }
                }),
        );
      }),
    );
  }
}
