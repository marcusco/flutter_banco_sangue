import 'dart:ffi';
import 'package:intl/intl.dart';

class Doador {
  //
  final int? id;
  final String nome;
  final String cpf;
  final String? rg;
  final DateTime dataNascimento;
  final String sexo;
  final String mae;
  final String? pai;
  final String? email;
  final String? cep;
  final String? endereco;
  final String? bairro;
  final String? cidade;
  final String? estado;
  final String? telefoneFixo;
  final String? celular;
  final String? tipoSanguineo;
  final double? altura;
  final int? peso;

  Doador(
      {this.id,
      required this.nome,
      required this.cpf,
      this.rg,
      required this.dataNascimento,
      required this.sexo,
      required this.mae,
      this.pai,
      this.email,
      this.cep,
      this.endereco,
      this.bairro,
      this.cidade,
      this.estado,
      this.telefoneFixo,
      this.celular,
      this.tipoSanguineo,
      this.peso,
      this.altura});

  factory Doador.fromJson(Map<String, dynamic> json) {
    late DateFormat fm;
    if (json['data_nasc'].toString().contains('/')) {
      fm = DateFormat('dd/MM/yyyy');
    } else {
      fm = DateFormat('dd-MM-yyyy');
    }
    return Doador(
        id: json['id'],
        nome: json['nome'],
        cpf: json['cpf'],
        rg: json['rg'],
        dataNascimento: fm.parse(json['data_nasc']),
        sexo: json['sexo'],
        mae: json['mae'],
        pai: json['pai'],
        email: json['email'],
        cep: json['cep'],
        endereco: json['endereco'],
        bairro: json['bairro'],
        cidade: json['cidade'],
        estado: json['estado'],
        telefoneFixo: json['telefone_fixo'],
        celular: json['celular'],
        tipoSanguineo: json['tipo_sanguineo'],
        altura: json['altura'],
        peso: json['peso']);
  }

  Map<String, dynamic> toJson() {
    var data = new Map<String, dynamic>();
    data['id'] = id;
    data['nome'] = nome;
    data['cpf'] = cpf;
    data['rg'] = rg;
    data['data_nasc'] = DateFormat('yyyy-MM-dd').format(dataNascimento);
    data['sexo'] = sexo;
    data['mae'] = mae;
    data['pai'] = pai;
    data['email'] = email;
    data['cep'] = cep;
    data['endereco'] = endereco;
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['estado'] = estado;
    data['telefone_fixo'] = telefoneFixo;
    data['celular'] = celular;
    data['tipo_sanguineo'] = tipoSanguineo;
    data['peso'] = peso;
    data['altura'] = altura;

    return data;
  }
}
