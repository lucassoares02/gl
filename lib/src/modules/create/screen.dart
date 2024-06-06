import 'package:flutter/material.dart';
import 'package:gl/src/components/button.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: SingleChildScrollView(
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
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios),
                      ),
                    ],
                  ),
                  const AppSpacing(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Marcos",
                            style: appTitleText,
                          ),
                          Text("Qual será o nosso próximo serviço?"),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Icon(Icons.person_outline),
                      )
                    ],
                  ),
                  const AppSpacing(),
                  const Text(
                    "Adicione um novo compromisso.",
                    style: appLabelText,
                  ),
                  const AppSpacing(),
                  const Text("Endereço", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: appInputDecoration(label: "Adicione um endereço..."),
                  ),
                  const AppSpacing(),
                  const Text("Data início", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: appInputDecoration(label: "DD/MM/AAAA"),
                  ),
                  const AppSpacing(),
                  const Text("Data fim", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: appInputDecoration(label: "DD/MM/AAAA"),
                  ),
                  const AppSpacing(),
                  const Text("Despesas", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: appInputDecoration(label: "R\$320,00"),
                  ),
                  const AppSpacing(),
                  const Text("Orçamento", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: appInputDecoration(label: "R\$130,00"),
                  ),
                  const AppSpacing(),
                  const Text("Cliente", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: appInputDecoration(label: "Adicione o cliente"),
                  ),
                  const AppSpacing(),
                  const Text("Descrição", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    decoration: appInputDecoration(label: "Adicione uma descrição"),
                  ),
                  const AppSpacing(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Total "),
                      Text(
                        "R\$450,00",
                        style: appLabelText,
                      ),
                    ],
                  ),
                  const AppSpacing(),
                  AppButton(label: "Enviar", onPressed: () {})
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
