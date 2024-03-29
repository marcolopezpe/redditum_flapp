import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

import 'login_form.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.bgSidebar,
        padding: EdgeInsets.symmetric(horizontal: 1.w),
        child: const SizedBox(
          width: double.infinity,
          child: LoginForm(),
        ),
      ),
    );
  }
}
