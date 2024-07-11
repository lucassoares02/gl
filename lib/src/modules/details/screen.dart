import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gl/src/components/button.dart';
import 'package:gl/src/modules/details/controller.dart';
import 'package:gl/src/modules/details/repository.dart';
import 'package:gl/src/modules/home/model.dart';
import 'package:gl/src/state/state_app.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

@RoutePage()
class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    super.key,
    this.schedule,
  });

  final Schedules? schedule;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  DetailsController detailsController = DetailsController(StateApp.start, DetailsRepository());
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Cliente"),
                          Text("${widget.schedule!.client}", style: appLabelText),
                        ],
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Despesas"),
                          Text("R\$0,00", style: appLabelText),
                        ],
                      ),
                    ],
                  ),
                  const AppSpacing(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Orçamento"),
                          Text("R\$${widget.schedule!.budget}", style: appLabelText),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Cidade"),
                          Text("${widget.schedule!.address}", style: appLabelText),
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
                  Text("${widget.schedule!.service}", style: appLabelText),
                  const AppSpacing(),
                  const AppSpacing(),
                  const AppSpacing(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Despesas "),
                      Text(
                        "R\$${widget.schedule!.budget}",
                        style: appLabelText,
                      ),
                    ],
                  ),
                  const AppSpacing(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Total "),
                      Text(
                        "R\$${widget.schedule!.budget}",
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
                  const AppSpacing(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        child: const Text("Recusar"),
                        onPressed: () {
                          detailsController.update(0, widget.schedule!.id!);
                        },
                      ),
                      const AppSpacing(),
                      AppButton(
                        label: "Aceitar",
                        onPressed: () {
                          detailsController.update(1, widget.schedule!.id!);
                          if (detailsController.state.value == StateApp.success) {
                            AutoRouter.of(context).pushNamed("/home");
                          }
                        },
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
