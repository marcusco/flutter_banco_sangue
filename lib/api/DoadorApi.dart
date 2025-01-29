import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_banco_sangue/api/ApiBase.dart';

import '../domain/Doador.dart';
import '../dto/DoadoresPorEstadoDTO.dart';

class DoadorApi extends ApiBase {
  static const url = 'api/doador';

  Future<List<Doador>> salvar(List<Doador> doadores) async {
    try {
      var request = jsonEncode(doadores.map((doador) => doador.toJson()).toList());
      final response = await http.post(Uri.parse(ApiBase.url_base + url + '/todos'),
          body: request,
          headers: queryParameters);
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        List<Doador> doadores =
            List<Doador>.from(l.map((model) => Doador.fromJson(model)));
        return doadores;
      } else {
        throw Exception('Erro ao salvar doadores.');
      }
    } on Exception catch (exception) {
      throw Exception('Erro ao fazer a requisição: $exception');
    }
  }

  Future<List<DoadoresPorEstadoDTO>> doadoresPorEstado() async {
    try {
      final response = await http.get(Uri.parse(ApiBase.url_base + url + '/doadores-por-estado'),
          headers: queryParameters);
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        List<DoadoresPorEstadoDTO> data =
            List<DoadoresPorEstadoDTO>.from(l.map((model) => DoadoresPorEstadoDTO.fromJson(model)));
        return data;
      } else {
        throw Exception('Erro ao buscar estatistica.');
      }
    } on Exception catch (exception) {
      throw Exception('Erro ao fazer a requisição: ${exception}');
    }
  }

  Future<List<Doador>> buscarTodos() async {
    try {
      final response = await http.get(Uri.parse(ApiBase.url_base + url),
          headers: queryParameters);
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        List<Doador> doadores =
        List<Doador>.from(l.map((model) => Doador.fromJson(model)));
        return doadores;
      } else {
        throw Exception('Erro ao salvar doadores.');
      }
    } on Exception catch (exception) {
      throw Exception('Erro ao fazer a requisição: $exception');
    }
  }
}
