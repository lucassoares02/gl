import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CreateRepository {
  Future create(String address, String client, String service, String phone, String budget, String initDate, String endDate, String expense) async {
    DateFormat originalFormat = DateFormat('dd/MM/yyyy');
    DateFormat newFormat = DateFormat('yyyy-MM-ddT00:00:00.087Z');

    DateTime dateTime = originalFormat.parse(initDate);
    String newDate = newFormat.format(dateTime);

    DateTime finishTime = originalFormat.parse(endDate);
    String newFinishTime = newFormat.format(finishTime);

    try {
      var a = await http.post(
        Uri.parse("http://localhost:5115/api/Agendamento/cadastrar-agendamento"),
        body: jsonEncode({
          "usuarioId": 1,
          "endereco": address,
          "nomeCliente": client,
          "telefone": phone,
          "valorOrcamento": double.parse(budget),
          "tipoServico": service,
          "dataInicio": "${newDate}Z",
          "dataFim": "${newFinishTime}Z",
          "despesas": double.parse(expense),
        }),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
      );
      return a;
    } catch (e) {
      debugPrint("Login Repository (Read) Error: $e");
    }
  }
}
