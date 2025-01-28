import 'dart:ffi';

class Doador {
  final Long? id;
  final String? nome;
  final String? cpf;
  final DateTime? dataNascimento;
  final String? sexo;
  final String? mae;
  final String? pai;
  final String? email;
  final String? cep;
  final String? endereco;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? telefoneFixo;
  final String? celular;
  final Long? tipoSanguineo;

  Doador(
      {this.id,
      this.nome,
      this.cpf,
      this.dataNascimento,
      this.sexo,
      this.mae,
      this.pai,
      this.email,
      this.cep,
      this.endereco,
      this.bairro,
      this.cidade,
      this.estado,
      this.telefoneFixo,
      this.celular,
      this.tipoSanguineo});

  factory Doador.fromJson(Map<String, dynamic> json) {
    return Doador(
        id: json['id'],
        nome: json['nome'],
        cpf: json['cpf'],
        dataNascimento: json['dataNascimento'],
        sexo: json['sexo'],
        mae: json['mae'],
        pai: json['pai'],
        email: json['email'],
        cep: json['cep'],
        endereco: json['endereco'],
        bairro: json['bairro'],
        cidade: json['cidade'],
        estado: json['estado'],
        telefoneFixo: json['telefoneFixo'],
        celular: json['celular'],
        tipoSanguineo: json['tipoSanguineo']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['dataNascimento'] = dataNascimento;
    data['sexo'] = sexo;
    data['mae'] = mae;
    data['pai'] = pai;
    data['email'] = email;
    data['cep'] = cep;
    data['endereco'] = endereco;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['telefoneFixo'] = telefoneFixo;
    data['celular'] = celular;
    data['tipoSanguineo'] = tipoSanguineo;

    return data;
  }
}
