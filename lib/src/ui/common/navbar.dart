/* Developed by: Eng. Mouaz M. Al-Shahmeh */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_flutter_app/src/providers/theme_provider.dart';
import 'package:quran_flutter_app/src/ui/screens/bookmark_screen.dart/bookmark_screen.dart';
import 'package:quran_flutter_app/src/ui/screens/home_screen/home_screen.dart';
import 'package:quran_flutter_app/src/ui/screens/radio_screen/radio_screen.dart';
import 'package:quran_flutter_app/src/ui/screens/settings_screen/settings_screen.dart';
import 'package:quran_flutter_app/src/utils/app_style.dart';

class NavigationBarWidget extends StatefulWidget {
  const NavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<NavigationBarWidget> createState() => _NavigationBarWidget();
}

class _NavigationBarWidget extends State<NavigationBarWidget> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const BookMarkScreen(),
    const RadioScreen(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppStyle.primaryColor,
          backgroundColor: context.watch<ThemeProvider>().isDark
              ? AppStyle.darkColor
              : const Color(0xC4FEFEFE),
          showUnselectedLabels: false,
          unselectedItemColor: const Color(0xFF6F6F6F),
          onTap: (int index) => setState(() => selectedIndex = index),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu_book_outlined,
                ),
                activeIcon: Icon(Icons.menu_book),
                label: 'الفهرس'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.bookmark_border,
                ),
                activeIcon: Icon(Icons.bookmark),
                label: 'الفواصل'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.radio_outlined,
                ),
                activeIcon: Icon(Icons.radio),
                label: 'الراديو'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings_outlined,
              ),
              activeIcon: Icon(Icons.settings),
              label: 'الإعدادت',
            )
          ]),
      body: screens[selectedIndex],
    );
  }
}
