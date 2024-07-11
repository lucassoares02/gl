import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gl/src/components/button.dart';
import 'package:gl/src/modules/register/controller.dart';
import 'package:gl/src/modules/register/repository.dart';
import 'package:gl/src/state/state_app.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerConfirmPassword = TextEditingController();
  RegisterController registerController = RegisterController(StateApp.start, RegisterRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        AutoRouter.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ],
                ),
                const AppSpacing(),
                const Text(
                  "Registre-se",
                  style: appTitleText,
                ),
                const AppSpacing(),
                const Text("E-mail", style: appLabelText),
                const SizedBox(height: 5),
                TextFormField(
                  controller: controllerEmail,
                  decoration: appInputDecoration(label: "Digite seu e-mail..."),
                ),
                const AppSpacing(),
                const Text("Senha", style: appLabelText),
                const SizedBox(height: 5),
                TextFormField(
                  controller: controllerPassword,
                  decoration: appInputDecoration(label: "Digite sua senha..."),
                ),
                const AppSpacing(),
                const Text("Confirme sua Senha", style: appLabelText),
                const SizedBox(height: 5),
                TextFormField(
                  controller: controllerConfirmPassword,
                  decoration: appInputDecoration(label: "Confirme sua senha..."),
                ),
                const AppSpacing(),
                AppButton(
                    label: "Registrar",
                    onPressed: () {
                      if (controllerPassword.text == controllerConfirmPassword.text) {
                        registerController.create(controllerEmail.text, controllerConfirmPassword.text);
                      }
                      // AutoRouter.of(context).pushNamed("/home");
                    }),
                const AppSpacing(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        AutoRouter.of(context).pushNamed("/login");
                      },
                      child: const Text("Possuí conta? Acesse"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
