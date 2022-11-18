import 'package:flutter/material.dart';
import 'package:redditum_flapp/app/ui/views/profile/widgets/profile_history.dart';
import 'package:redditum_flapp/app/ui/views/profile/widgets/profile_info.dart';
import 'package:redditum_flapp/app/ui/views/profile/widgets/profile_password.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.bgCard,
        appBar: AppBar(
          backgroundColor: AppColors.bgSidebar,
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_circle)),
              Tab(icon: Icon(Icons.lock)),
              Tab(icon: Icon(Icons.history)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ProfileInfo(),
            ProfilePassword(),
            ProfileHistory(),
          ],
        ),
      ),
    );
  }
}
