import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gl/src/modules/home/components/app_card.dart';
import 'package:gl/src/modules/home/controller.dart';
import 'package:gl/src/modules/home/repository.dart';
import 'package:gl/src/state/state_app.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = HomeController(StateApp.start, HomeRepository());

  @override
  void initState() {
    homeController.find();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(appPadding),
        child: RefreshIndicator(
          onRefresh: () => homeController.find(),
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
                          onPressed: () {
                            AutoRouter.of(context).pop();
                          },
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
                        InkWell(
                          onTap: () => homeController.find(),
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(Icons.person_outline),
                          ),
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
                        IconButton(
                            onPressed: () {
                              AutoRouter.of(context).pushNamed("/create");
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    ),
                    ValueListenableBuilder(
                      valueListenable: homeController.state,
                      builder: (context, value, child) {
                        return value == StateApp.loading
                            ? const CircularProgressIndicator()
                            : Column(
                                children: homeController.schedules.map((schedule) {
                                return schedule.status != "Pendente Confirmação"
                                    ? AppCard(
                                        schedule: schedule,
                                        title: "${schedule.service}",
                                        date: "23/04/2002",
                                        day: "3 dias",
                                        location: "${schedule.address}",
                                        color: schedule.status == "Confirmado"
                                            ? Colors.green
                                            : schedule.status == "Cancelado"
                                                ? Colors.red
                                                : Colors.orange)
                                    : Container();
                              }).toList());
                      },
                    ),
                    const AppSpacing(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pendentes", style: appLabelText),
                      ],
                    ),
                    const AppSpacing(),
                    ValueListenableBuilder(
                      valueListenable: homeController.state,
                      builder: (context, value, child) {
                        return value == StateApp.loading
                            ? const CircularProgressIndicator()
                            : Column(
                                children: homeController.schedules.map(
                                  (schedule) {
                                    return schedule.status == "Pendente Confirmação"
                                        ? AppCard(
                                            schedule: schedule,
                                            title: "${schedule.service}",
                                            date: "23/04/2002",
                                            day: "3 dias",
                                            location: "${schedule.address}",
                                            color: Colors.orange,
                                          )
                                        : Container();
                                  },
                                ).toList(),
                              );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
