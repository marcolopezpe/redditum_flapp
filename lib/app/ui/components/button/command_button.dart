import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redditum_flapp/app/ui/components/custom_color_type.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class CommandButton extends StatelessWidget {
  const CommandButton({
    Key? key,
    this.click,
    required this.text,
    required this.type,
  }) : super(key: key);

  final void Function()? click;
  final String text;
  final CustomColorType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.w, bottom: 10.w),
      decoration: BoxDecoration(
        color: _buttonType(type),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: MaterialButton(
        minWidth: double.infinity,
        height: 55.h,
        onPressed: click,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 10.h,
          ),
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
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
