import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/controllers/auth_controllers.dart';
import 'package:grocery_app/screens/main/home/widgets/product_grid.dart';
import 'package:grocery_app/utils/app_colors.dart';
import 'package:grocery_app/utils/assets_constants.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(AssetConstants.menuIcon),
                Row(
                  children: [
                    SvgPicture.asset(AssetConstants.cartIcon),
                    IconButton(
                      onPressed: () {
                        AuthController().logout();
                      },
                      icon: const Icon(
                        Icons.logout,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const CustomText(
              text: "Vegitables",
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            const SizedBox(
              height: 41,
            ),
            const ProductGrid()
          ],
        ),
      ),
    );
  }
}
