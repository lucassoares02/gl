import 'package:flutter/material.dart';
import 'package:gl/src/modules/home/components/app_card.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                        Row(
                          children: [
                            Text("Bem vindo, ", style: TextStyle(fontSize: 24)),
                            Text(
                              "Marcos",
                              style: appTitleText,
                            ),
                          ],
                        ),
                        Text("Marido de aluguel"),
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
                const Text("Bem-vindo a sua agenda pessoal de serviços, a ferramenta essencial para organizar e otimizar o seu dia a dia."),
                const AppSpacing(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Compromissos", style: appLabelText),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                  ],
                ),
                const AppCard(
                  title: "Elétrica",
                  date: "24/05/2024",
                  location: "Laranjeiras Velha - Serra ES",
                  day: "3 dias",
                  color: Colors.green,
                ),
                const AppCard(
                  title: "Bombeiro hidráulico",
                  date: "11/06/2024",
                  location: "Barcelona - Serra ES",
                  day: "1 dia",
                  color: Colors.green,
                ),
                const AppSpacing(),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pendentes", style: appLabelText),
                  ],
                ),
                const AppSpacing(),
                const AppCard(
                  title: "Elétrica",
                  date: "12/08/2024",
                  day: "7 dias",
                  location: "Castelândia - Serra ES",
                  color: Colors.orange,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
