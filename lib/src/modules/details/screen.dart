import 'package:flutter/material.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
                          Text("Confira o seu compromisso"),
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
                    "Detalhes do compromisso.",
                    style: appLabelText,
                  ),
                  const AppSpacing(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cliente"),
                          Text("Argenor Fonseca", style: appLabelText),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Despesas"),
                          Text("R\$120,00", style: appLabelText),
                        ],
                      ),
                    ],
                  ),
                  const AppSpacing(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Orçamento"),
                          Text("R\$330,00", style: appLabelText),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Cidade"),
                          Text("Serra-ES", style: appLabelText),
                        ],
                      ),
                    ],
                  ),
                  const AppSpacing(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Data início"),
                          Text("25/04/2024", style: appLabelText),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Data fim"),
                          Text("27/04/2024", style: appLabelText),
                        ],
                      ),
                    ],
                  ),
                  const AppSpacing(),
                  const Text("Descrição"),
                  const Text("Elétrica", style: appLabelText),
                  const AppSpacing(),
                  const AppSpacing(),
                  const AppSpacing(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Despesas "),
                      Text(
                        "R\$120,00",
                        style: appLabelText,
                      ),
                    ],
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Lucro "),
                      Text(
                        "R\$330,00",
                        style: appLabelText,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
