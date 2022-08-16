/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter_app/src/providers/theme_provider.dart';
import 'package:quran_flutter_app/src/utils/app_style.dart';
import 'package:quran_flutter_app/src/utils/theme_preferences.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemePreferences theme = ThemePreferences();
  @override
  Widget build(BuildContext context) {
    var themeProv = context.watch<ThemeProvider>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Text(
                      'الإعدادت',
                      textDirection: TextDirection.rtl,
                      style: AppStyle.titleTextStyle,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'الوضع الليلي',
                              style: AppStyle.bodyTextStyle,
                            ),
                            Transform.scale(
                              scaleX: 1.3,
                              scaleY: 1.1,
                              child: Switch(
                                value: themeProv.isDark,
                                onChanged: (bool value) {
                                  themeProv.isDark = value;
                                },
                                // design
                                activeThumbImage:
                                    const AssetImage('assets/images/moon.png'),
                                inactiveThumbImage:
                                    const AssetImage('assets/images/sun.png'),
                                activeTrackColor: AppStyle.darkColor2,
                                activeColor: AppStyle.darkColor,
                                //
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Divider(thickness: 1.4)
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
