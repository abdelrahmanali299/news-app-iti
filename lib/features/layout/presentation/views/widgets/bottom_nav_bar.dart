import 'package:curved_navigation_bar_pro/curved_navigation_bar_pro.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.onTap, required this.index});
  final void Function(int) onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBarPro(
      fabColor: Color(0xffFFA500),
      activeTextStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      activeIconColor: Colors.white,
      inactiveColor: Colors.white,
      activeColor: Colors.white,
      backgroundColor: Color(0xff001F3F),
      barHeight: 80,
      navbarStyle: CNBPStyles.royalAmethyst,
      items: [
        CurvedNavigationItemPro(
          inactiveIcon: Icons.home_outlined,
          activeIcon: Icons.home_rounded,
          label: index == 0 ? 'Home' : '',
        ),
        CurvedNavigationItemPro(
          inactiveIcon: Icons.search_outlined,
          activeIcon: Icons.search_rounded,
          label: index == 1 ? 'Search' : '',
        ),
        CurvedNavigationItemPro(
          inactiveIcon: Icons.confirmation_num_outlined,
          activeIcon: Icons.confirmation_num_rounded,
          label: index == 2 ? 'Saved' : '',
        ),
      ],
      currentIndex: index,
      onTap: onTap,
    );
  }
}
