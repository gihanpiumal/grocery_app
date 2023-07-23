import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/screens/main/favorites/favorites.dart';
import 'package:grocery_app/screens/main/home/home.dart';
import 'package:grocery_app/screens/main/profile/profile.dart';
import 'package:grocery_app/screens/main/search/search.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    _screens.addAll(
        {const Home(), const Favorites(), const Search(), const Profile()});
    super.initState();
  }

  ///list to store botom navigation screen
  final List<Widget> _screens = [];

  /// store the active index
  int activeIndex = 0;

  /// ontap function
  void onTapped(int item) {
    setState(() {
      activeIndex = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[activeIndex],
      bottomNavigationBar: SizedBox(
        height: 83,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                child: SvgPicture.asset(
                  AssetConstants.homeIcon,
                  color: activeIndex == 0
                      ? AppColors.primaryColor
                      : AppColors.kAsh,
                ),
                onTap: () => onTapped(0)),
            InkWell(
                child: SvgPicture.asset(
                  AssetConstants.heartIcon,
                  color: activeIndex == 1
                      ? AppColors.primaryColor
                      : AppColors.kAsh,
                ),
                onTap: () => onTapped(1)),
            InkWell(
                child: SvgPicture.asset(
                  AssetConstants.searchIcon,
                  color: activeIndex == 2
                      ? AppColors.primaryColor
                      : AppColors.kAsh,
                ),
                onTap: () => onTapped(2)),
            InkWell(
                child: SvgPicture.asset(
                  AssetConstants.userIcon,
                  color: activeIndex == 3
                      ? AppColors.primaryColor
                      : AppColors.kAsh,
                ),
                onTap: () => onTapped(3)),
          ],
        ),
      ),
    );
  }
}
