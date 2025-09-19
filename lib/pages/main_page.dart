import 'package:flutter/material.dart';
import 'package:saving_apps/pages/home/home_page.dart';
import 'package:saving_apps/pages/portfolio/portfolio_page.dart';
import 'package:saving_apps/pages/profile/profile_page.dart';
import 'package:saving_apps/pages/support/support_page.dart';
import 'package:saving_apps/style/colors.dart';
import 'package:saving_apps/style/text_style.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const nameRoute = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> pages = [
    HomePage(),
    PortfolioPage(),
    SupportPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      body: pages[_selectedIndex],
      bottomNavigationBar: _customBottomNav(),
    );
  }

  Widget _customBottomNav() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: kBlack.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: kCaption,
          unselectedLabelStyle: kCaption,
          selectedItemColor: kBlueRibbon,
          unselectedItemColor: kDarkGray,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home.png',
                width: 24,
                color: _selectedIndex == 0 ? kBlueRibbon : kDarkGray,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/portfolio.png',
                width: 24,
                color: _selectedIndex == 1 ? kBlueRibbon : kDarkGray,
              ),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/support.png',
                width: 24,
                color: _selectedIndex == 2 ? kBlueRibbon : kDarkGray,
              ),
              label: 'Support',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/profile.png',
                width: 24,
                color: _selectedIndex == 3 ? kBlueRibbon : kDarkGray,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
