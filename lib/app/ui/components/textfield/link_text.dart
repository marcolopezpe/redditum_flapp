import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class LinkText extends StatelessWidget {
  const LinkText({
    Key? key,
    required this.text,
    this.click,
    this.color,
  }) : super(key: key);

  final String text;
  final void Function()? click;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.w, bottom: 10.w),
      child: GestureDetector(
        onTap: click,
        child: Text(
          text,
          style: Theme.of(context).textTheme.subtitle1?.copyWith(
                color: color ?? AppColors.primary,
                fontFamily: 'DroidSans',
                fontSize: 14,
              ),
        ),
      ),
    );
  }
}
