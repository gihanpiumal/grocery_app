import 'package:flutter/material.dart';
import 'package:grocery_app/components/custom_text.dart';
import 'package:grocery_app/providers/auth/user_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Consumer<UserProvider>(
      builder: (context, value, child) {
        return Center(
            child: value.isLoading
                ? const CircularProgressIndicator()
                : CustomText(
                    text: value.userModel.name,
                    fontSize: 20,
                  ));
      },
    ));
  }
}
