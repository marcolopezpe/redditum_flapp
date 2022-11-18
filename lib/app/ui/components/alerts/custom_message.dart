import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redditum_flapp/app/ui/components/custom_color_type.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class CustomMessage extends StatelessWidget {
  const CustomMessage({
    Key? key,
    required this.message,
    this.type,
  }) : super(key: key);

  final String message;
  final CustomColorType? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.w, bottom: 20.w),
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _buttonType(type ?? CustomColorType.primary),
        boxShadow: [
          BoxShadow(
              color: _buttonType(type ?? CustomColorType.primary),
              spreadRadius: 3),
        ],
      ),
      child: Text(
        message,
        style: Theme.of(context).textTheme.subtitle1?.copyWith(
              color: Colors.white,
              fontFamily: 'DroidSans',
              fontSize: 14.5,
            ),
      ),
    );
  }

  Color _buttonType(CustomColorType type) {
    switch (type) {
      case CustomColorType.primary:
        return AppColors.primary;
      case CustomColorType.success:
        return AppColors.green;
      case CustomColorType.warning:
        return AppColors.amber;
      case CustomColorType.danger:
        return AppColors.red;
      default:
        return AppColors.primary;
    }
  }
}
