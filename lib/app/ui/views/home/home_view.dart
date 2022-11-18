import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/components/menus/bar_menu.dart';
import 'package:redditum_flapp/app/ui/components/menus/vertical_menu.dart';
import 'package:redditum_flapp/app/ui/views/home/home_controller.dart';
import 'package:redditum_flapp/app/ui/views/home/widgets/home_content.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        drawer: const VerticalMenu(),
        appBar: const BarMenu("Inicio"),
        backgroundColor: AppColors.bgCard,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: const [
              Positioned(
                child: SingleChildScrollView(
                  child: HomeContent(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
