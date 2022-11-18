import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/components/logos/custom_logo.dart';
import 'package:redditum_flapp/app/ui/views/splash/splash_controller.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColors.bgSidebar,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomLogo(),
              SizedBox(height: 20.h),
              SizedBox(
                width: 100.w,
                child: const LinearProgressIndicator(
                  backgroundColor: AppColors.bg,
                  color: AppColors.bgSidebar,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
