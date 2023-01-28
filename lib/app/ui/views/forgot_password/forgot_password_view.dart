import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/views/forgot_password/forgot_password_controller.dart';
import 'package:redditum_flapp/app/ui/views/forgot_password/widgets/forgot_password_content.dart';
import 'package:redditum_flapp/app/ui/views/forgot_password/widgets/forgot_password_header.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
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
                        ForgotPasswordHeader(),
                        ForgotPasswordContent(),
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
