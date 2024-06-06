import 'package:flutter/material.dart';
import 'package:gl/src/components/button.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                Row(),
                const AppSpacing(),
                const Text(
                  "Registre-se",
                  style: appTitleText,
                ),
                const AppSpacing(),
                const Text("E-mail", style: appLabelText),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: appInputDecoration(label: "Digite seu e-mail..."),
                ),
                const AppSpacing(),
                const Text("Nome", style: appLabelText),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: appInputDecoration(label: "Digite seu nome..."),
                ),
                const AppSpacing(),
                const Text("Senha", style: appLabelText),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: appInputDecoration(label: "Digite sua senha..."),
                ),
                const AppSpacing(),
                const Text("Confirme sua Senha", style: appLabelText),
                const SizedBox(height: 5),
                TextFormField(
                  decoration: appInputDecoration(label: "Confirme sua senha..."),
                ),
                const AppSpacing(),
                AppButton(label: "Registrar", onPressed: () {}),
                const AppSpacing(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
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
