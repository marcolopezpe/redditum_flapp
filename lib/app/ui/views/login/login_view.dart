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
      builder: (controller) => SafeArea(
        bottom: false,
        child: Scaffold(
          backgroundColor: AppColors.bgCard,
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: const [
                        LoginHeader(),
                        LoginContent(),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
