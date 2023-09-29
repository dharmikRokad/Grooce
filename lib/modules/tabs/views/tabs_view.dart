import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:grooce/modules/cart/views/cart_view.dart';
import 'package:grooce/modules/favorite/views/favorite_view.dart';
import 'package:grooce/modules/profile/views/profile_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/tabs_controller.dart';

class TabsView extends GetView<TabsController> {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => [
          const HomeView(),
          const FavoriteView(),
          const CartView(),
          const ProfileView(),
        ][controller.currentIndex()],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBar(
          selectedIndex: controller.currentIndex(),
          onDestinationSelected: controller.onTabChanged,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: _buildDestinations(),
        ),
      ),
    );
  }

  List<Widget> _buildDestinations() => const [
        NavigationDestination(
            icon: Icon(CupertinoIcons.house_alt),
            selectedIcon: Icon(CupertinoIcons.house_alt_fill),
            label: 'Home'),
        NavigationDestination(
            icon: Icon(CupertinoIcons.heart),
            selectedIcon: Icon(CupertinoIcons.heart_fill),
            label: 'Favorite'),
        NavigationDestination(
            icon: Icon(CupertinoIcons.cart),
            selectedIcon: Icon(CupertinoIcons.cart_fill),
            label: 'Cart'),
        NavigationDestination(
            icon: Icon(CupertinoIcons.person),
            selectedIcon: Icon(CupertinoIcons.person_fill),
            label: 'Profile'),
      ];
}
