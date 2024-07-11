class Schedules {
  int? id;
  String? address;
  String? client;
  String? phone;
  String? initDate;
  String? endDate;
  int? expense;
  double? budget;
  String? service;
  String? status;

  Schedules({this.id, this.address, this.client, this.phone, this.budget, this.service, this.status, this.initDate, this.endDate, this.expense});

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    address = json["endereco"];
    client = json["nomeCliente"];
    phone = json["telefone"];
    budget = json["valorOrcamento"];
    service = json["tipoServico"];
    status = json["status"];
    initDate = json["dataInicio"];
    endDate = json["dataFim"];
    expense = json["despesas"];
  }
}
