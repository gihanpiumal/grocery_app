import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grocery_app/screens/main/home/widgets/product_grid.dart';
import 'package:grocery_app/utils/assets_constants.dart';

import '../../../components/custom_text.dart';
import '../../../utils/app_colors.dart';

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
                SvgPicture.asset(AssetConstants.cartIcon),
              ],
            ),
            const CustomText(
              text: 'Vegetables',
              textAlign: TextAlign.center,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
            const SizedBox(
              height: 41,
            ),
            const ProductGrid(),
          ],
        ),
      ),
    );
  }
}
