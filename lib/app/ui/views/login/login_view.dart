import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/views/login/login_controller.dart';
import 'package:redditum_flapp/app/ui/views/login/widgets/login_content.dart';
import 'package:redditum_flapp/app/ui/views/login/widgets/login_header.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.bgCard,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                children: const [
                  LoginHeader(),
                  LoginContent(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
