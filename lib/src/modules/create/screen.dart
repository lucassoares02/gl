import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gl/src/components/button.dart';
import 'package:gl/src/modules/create/controller.dart';
import 'package:gl/src/modules/create/repository.dart';
import 'package:gl/src/state/state_app.dart';
import 'package:gl/src/utils/app_spacing.dart';
import 'package:gl/src/utils/decorations.dart';
import 'package:gl/src/utils/spacing.dart';

@RoutePage()
class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  CreateController createController = CreateController(StateApp.start, CreateRepository());
  TextEditingController addressController = TextEditingController();
  TextEditingController clientController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController budgetController = TextEditingController();
  TextEditingController serviceController = TextEditingController();
  TextEditingController initDateController = TextEditingController();
  TextEditingController finishDateController = TextEditingController();
  TextEditingController expenseController = TextEditingController();

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
                    controller: addressController,
                    decoration: appInputDecoration(label: "Adicione um endereço..."),
                  ),
                  const AppSpacing(),
                  const Text("Data início", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: initDateController,
                    keyboardType: TextInputType.datetime,
                    decoration: appInputDecoration(label: "DD/MM/AAAA"),
                  ),
                  const AppSpacing(),
                  const Text("Data fim", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: finishDateController,
                    decoration: appInputDecoration(label: "DD/MM/AAAA"),
                  ),
                  const AppSpacing(),
                  const Text("Despesas", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: expenseController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: appInputDecoration(label: "R\$320,00"),
                  ),
                  const AppSpacing(),
                  const Text("Contato", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: phoneController,
                    decoration: appInputDecoration(label: "(27) 9 9999-9999"),
                  ),
                  const AppSpacing(),
                  const Text("Orçamento", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: (value) {
                      setState(() {});
                    },
                    keyboardType: TextInputType.number,
                    controller: budgetController,
                    decoration: appInputDecoration(label: "R\$130,00"),
                  ),
                  const AppSpacing(),
                  const Text("Cliente", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: clientController,
                    decoration: appInputDecoration(label: "Adicione o cliente"),
                  ),
                  const AppSpacing(),
                  const Text("Serviço", style: appLabelText),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: serviceController,
                    decoration: appInputDecoration(label: "Ex: Pedreiro"),
                  ),
                  const AppSpacing(),
                  if (budgetController.text.isNotEmpty && expenseController.text.isNotEmpty)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("Total "),
                        Text(
                          "${int.parse(budgetController.text) + int.parse(expenseController.text)}",
                          style: appLabelText,
                        ),
                      ],
                    ),
                  const AppSpacing(),
                  AppButton(
                      label: "Enviar",
                      onPressed: () async {
                        await createController.create(
                          addressController.text,
                          clientController.text,
                          serviceController.text,
                          phoneController.text,
                          budgetController.text,
                          initDateController.text,
                          finishDateController.text,
                          expenseController.text,
                        );

                        if (createController.state.value == StateApp.success) {
                          AutoRouter.of(context).replaceNamed("/home");
                        }
                      })
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
