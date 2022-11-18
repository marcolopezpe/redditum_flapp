import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redditum_flapp/app/ui/views/forgot_password/widgets/forgot_password_form.dart';

class ForgotPasswordContent extends StatelessWidget {
  const ForgotPasswordContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: const SizedBox(
          width: double.infinity,
          child: ForgotPasswordForm(),
        ),
      ),
    );
  }
}
