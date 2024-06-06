import 'package:flutter/material.dart';
import 'package:gl/src/components/button.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  decoration: appInputDecoration(label: "Digite seu e-mail..."),
                ),
                const AppSpacing(),
                const Text("Senha", style: appLabelText),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: appInputDecoration(label: "Digite sua senha..."),
                ),
                const AppSpacing(),
                AppButton(label: "Entrar", onPressed: () {}),
                const AppSpacing(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
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
