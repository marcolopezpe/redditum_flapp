import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:redditum_flapp/app/ui/components/button/command_button.dart';
import 'package:redditum_flapp/app/ui/components/custom_color_type.dart';
import 'package:redditum_flapp/app/ui/components/textfield/input_text.dart';
import 'package:redditum_flapp/app/ui/components/textfield/label_text.dart';
import 'package:redditum_flapp/app/ui/views/profile/profile_controller.dart';
import 'package:redditum_flapp/core/theme/app_colors.dart';

class ProfilePasswordForm extends GetView<ProfileController> {
  const ProfilePasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const LabelText(
                text: "Cambiar Contrase\u{00F1}a",
                fontSize: 30,
              ),
              const LabelText(
                text:
                    "Ingresa tu contrase\u{00F1}a actual, la nueva y confırmala.",
                fontColor: AppColors.whiteHint,
              ),
              const LabelText(text: "Contraseña Actual"),
              InputText(
                controller: controller.ctrlTextContrasenaActual,
                obscureText: true,
              ),
              const LabelText(text: "Nueva Contrase\u{00F1}a"),
              InputText(
                controller: controller.ctrlTextNuevaContrasena,
                obscureText: true,
              ),
              const LabelText(text: "Confirmar Nueva Contrase\u{00F1}a"),
              InputText(
                controller: controller.ctrlTextConfirmarNuevaContrasena,
                obscureText: true,
              ),
              const SizedBox(height: 10),
              const Divider(color: AppColors.whiteHint, height: 1.0),
              const SizedBox(height: 10),
              CommandButton(
                text: "Actualizar Contrase\u{00F1}a",
                type: CustomColorType.warning,
                click: controller.updatePassword,
              ),
            ],
          ),
        );
      },
    );
  }
}
