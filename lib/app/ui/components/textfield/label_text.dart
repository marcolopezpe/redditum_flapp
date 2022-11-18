import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class LabelText extends StatelessWidget {
  const LabelText({
    Key? key,
    required this.text,
    this.fontSize,
    this.fontColor,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.w, bottom: 10.w),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
            color: fontColor ?? AppColors.bgWhite,
            fontFamily: 'DroidSans',
            fontSize: fontSize ?? 16),
      ),
    );
  }
}
