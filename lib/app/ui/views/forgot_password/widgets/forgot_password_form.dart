import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/routes/app_routes.dart';
import 'package:redditum_flapp/app/ui/components/custom_color_type.dart';
import 'package:redditum_flapp/app/ui/components/button/command_button.dart';
import 'package:redditum_flapp/app/ui/components/textfield/input_text.dart';
import 'package:redditum_flapp/app/ui/components/textfield/label_text.dart';
import 'package:redditum_flapp/app/ui/components/textfield/link_text.dart';
import 'package:redditum_flapp/app/ui/views/forgot_password/forgot_password_controller.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class ForgotPasswordForm extends GetView<ForgotPasswordController> {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(
            child: LabelText(
              text: "Recuperar Contrase\u{00F1}a",
              fontSize: 30.0,
            ),
          ),
          SizedBox(height: 10.w),
          const LabelText(
              text:
                  "Ingrese su nombre de usuario para recibir en su e-mail los pasos para la recuperación."),
          SizedBox(height: 10.w),
          const LabelText(text: "Usuario"),
          InputText(
            controller: controller.ctrlTextUsername,
            hintText: "Usuario",
            keyboardType: TextInputType.text,
          ),
          SizedBox(height: 10.w),
          CommandButton(
            type: CustomColorType.success,
            text: "Enviar",
            click: controller.sendEmail,
          ),
          LinkText(
            text: "¡Ya recuerdo mi contrase\u{00F1}a, ir al Login!",
            click: () => Get.toNamed(AppRoutes.login),
          ),
          SizedBox(height: 20.w),
          const Divider(color: AppColors.whiteHint, height: 1.0),
          const Center(
            child: LinkText(
              text: "Redditum v1.0.0",
              color: AppColors.whiteHint,
            ),
          ),
          SizedBox(height: 20.w),
        ],
      ),
    );
  }
}
