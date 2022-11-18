import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/images/logo-light.svg',
          height: 100.w,
        ),
        /*const SizedBox(height: 20),
        RichText(
          text: TextSpan(
            text: "Redditum",
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: AppColors.bgWhite,
                  fontFamily: 'DroidSans',
                ),
          ),
        ),*/
      ],
    );
  }
}
