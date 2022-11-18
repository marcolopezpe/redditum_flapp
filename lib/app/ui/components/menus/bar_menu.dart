import 'package:flutter/material.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class BarMenu extends StatelessWidget implements PreferredSizeWidget {
  const BarMenu(
    this.title, {
    Key? key,
    this.tabBar,
  }) : super(key: key);

  final String title;
  final TabBar? tabBar;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bgSidebar,
      title: Text(title),
      bottom: tabBar,
      /*actions: [
        Container(
          padding: const EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              Center(
                child: SizedBox(
                  width: 60,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                  ),
                ),
              ),
              const Positioned(
                right: 3,
                top: 3,
                child: Text(
                  "2",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],*/
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
