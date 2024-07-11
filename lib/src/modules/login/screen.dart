import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gl/src/components/button.dart';
import 'package:gl/src/modules/login/controller.dart';
import 'package:gl/src/modules/login/repository.dart';
import 'package:gl/src/state/state_app.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  LoginController loginController = LoginController(StateApp.start, LoginRepository());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "/logo.png",
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login",
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
                ValueListenableBuilder(
                    valueListenable: loginController.state,
                    builder: (context, value, child) {
                      return value == StateApp.loading
                          ? const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircularProgressIndicator(),
                              ],
                            )
                          : AppButton(
                              label: "Entrar",
                              onPressed: () async {
                                if (controllerEmail.text.length > 4 && controllerPassword.text.length > 2) {
                                  await loginController.login(controllerEmail.text, controllerPassword.text);
                                  if (loginController.statusCode == 200) {
                                    AutoRouter.of(context).pushNamed("/home");
                                  }
                                }
                              });
                    }),
                const AppSpacing(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        AutoRouter.of(context).pushNamed("/register");
                      },
                      child: const Text("Não possuí conta? Registre-se"),
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
