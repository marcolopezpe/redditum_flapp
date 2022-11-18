import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/components/menus/bar_menu.dart';
import 'package:redditum_flapp/app/ui/components/menus/vertical_menu.dart';
import 'package:redditum_flapp/app/ui/views/profile/profile_controller.dart';
import 'package:redditum_flapp/app/ui/views/profile/widgets/profile_content.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => const Scaffold(
        drawer: VerticalMenu(),
        appBar: BarMenu("Mi Perfil"),
        body: SafeArea(
          bottom: false,
          child: ProfileContent(),
        ),
      ),
    );
  }
}
