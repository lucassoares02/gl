import 'dart:developer';

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
import 'package:intl/intl.dart';

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
                            "",
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
                      if (widget.schedule!.expense != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Despesas"),
                            Text("${widget.schedule!.expense!}", style: appLabelText),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (widget.schedule!.initDate != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Data início"),
                            Text(
                              DateFormat("dd/MM/yyyy").format(DateTime.parse(widget.schedule!.initDate!)),
                              style: appLabelText,
                            ),
                          ],
                        ),
                      if (widget.schedule!.endDate != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Data fim"),
                            Text(
                              DateFormat("dd/MM/yyyy").format(DateTime.parse(widget.schedule!.endDate!)),
                              style: appLabelText,
                            ),
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
                        "R\$${widget.schedule!.expense}",
                        style: appLabelText,
                      ),
                    ],
                  ),
                  const AppSpacing(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Orçamento: "),
                      Text(
                        "R\$${widget.schedule!.budget}",
                        style: appLabelText,
                      ),
                    ],
                  ),
                  const AppSpacing(),
                  if (widget.schedule!.budget != null && widget.schedule!.expense != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Lucro: "),
                        Text(
                          widget.schedule!.budget! - widget.schedule!.expense! > 0 ? "R\$${widget.schedule!.budget! - widget.schedule!.expense!}" : "R\$0",
                          style: appLabelText,
                        ),
                      ],
                    ),
                  const AppSpacing(),
                  widget.schedule!.status == "Pendente Confirmação"
                      ? Column(
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
                                AutoRouter.of(context).pushNamed("/home");
                              },
                            ),
                          ],
                        )
                      : widget.schedule!.status == "Confirmado"
                          ? Container(
                              width: double.maxFinite,
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: appPadding),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(appRadius),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Confirmado",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              width: double.maxFinite,
                              height: 50,
                              padding: const EdgeInsets.symmetric(horizontal: appPadding),
                              decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(appRadius),
                              ),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.close,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Cancelado",
                                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
