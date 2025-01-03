import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:tamerin/pages/add_page.dart';
import 'package:tamerin/pages/blog_page.dart';
import 'package:tamerin/pages/home_page.dart';
import 'package:tamerin/pages/profile_page.dart';
import 'package:tamerin/pages/transaction_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      TransactionPage(),
      AddPage(),
      BlogPage(),
      ProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home_rounded,
          size: 35,
        ),
        title: "Home",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey.shade500,
        textStyle: const TextStyle(
          fontSize: 14, // Ukuran teks
          height: 1.5, // Tinggi baris untuk mengatur jarak
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.assignment_rounded,
          size: 35,
        ),
        title: "Transaction",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey.shade500,
        textStyle: const TextStyle(
          fontSize: 14, // Ukuran teks
          height: 1.5, // Tinggi baris untuk mengatur jarak
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
        title: "Add",
        activeColorPrimary: Color(0xFF8E4FF4), // Warna ikon
        inactiveColorPrimary: Colors.grey.shade500, // Warna ikon saat nonaktif
        textStyle: const TextStyle(
          fontSize: 14, // Ukuran teks
          height: 1.5, // Tinggi baris untuk mengatur jarak
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.newspaper,
          size: 35,
        ),
        title: "Blog",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey.shade500,
        textStyle: const TextStyle(
          fontSize: 14, // Ukuran teks
          height: 1.5, // Tinggi baris untuk mengatur jarak
        ),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.account_circle,
          size: 35,
        ),
        title: "Profile",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey.shade500,
        textStyle: const TextStyle(
          fontSize: 14, // Ukuran teks
          height: 1.5, // Tinggi baris untuk mengatur jarak
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8),
      backgroundColor: Colors.white,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 60, // Tinggi navbar
      decoration: NavBarDecoration(
        colorBehindNavBar: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 5,
            offset: Offset(0, 0.5), // Efek melayang
          ),
        ],
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property
    );
  }
}
