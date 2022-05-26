import 'package:flutter/material.dart';
import 'package:postest6_2009106072_gilang/utils/bottom_navbar_index.dart';
import 'package:provider/provider.dart';
import '../pages/forecast_page.dart';
import '../pages/cuaca_page.dart';
import '../pages/settings_page.dart';

class MainPage extends StatelessWidget {
  final List<Widget> _pages = [
    const CuacaPage(),
    const ForecastPage(),
    SettingsPage(),
  ];

  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(context.watch<BottomNavBarIndex>().currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) =>
            context.read<BottomNavBarIndex>().currentIndex = index,
        currentIndex: context.watch<BottomNavBarIndex>().currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.cloud_outlined,
            ),
            activeIcon: Icon(
              Icons.cloud,
            ),
            label: "Cuaca",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.show_chart_outlined),
            label: "Ramalan Cuaca",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_outlined,
            ),
            activeIcon: Icon(
              Icons.settings,
            ),
            label: "Pengaturan",
          )
        ],
      ),
    );
  }
}