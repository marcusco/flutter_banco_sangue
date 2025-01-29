import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_banco_sangue/api/ApiBase.dart';

import '../domain/Doador.dart';
import '../dto/DoadoresPorEstadoDTO.dart';
import '../dto/MediaIdadeTipoSanguineoDTO.dart';
import '../dto/ObesosPorSexoDTO.dart';
import '../dto/QuantidadeDoadoresPorTipoSanguineoDTO.dart';

class DoadorApi extends ApiBase {
  static const url = 'api/doador';
  static const url_imc = 'api/imc';
  Future<List<Doador>> salvar(List<Doador> doadores) async {
    try {
      var request =
          jsonEncode(doadores.map((doador) => doador.toJson()).toList());
      final response = await http.post(
          Uri.parse(ApiBase.url_base + url + '/todos'),
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
      final response = await http.get(
          Uri.parse(ApiBase.url_base + url + '/doadores-por-estado'),
          headers: queryParameters);
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        List<DoadoresPorEstadoDTO> data = List<DoadoresPorEstadoDTO>.from(
            l.map((model) => DoadoresPorEstadoDTO.fromJson(model)));
        return data;
      } else {
        throw Exception('Erro ao buscar estatistica.');
      }
    } on Exception catch (exception) {
      throw Exception('Erro ao fazer a requisição: ${exception}');
    }
  }

  Future<List<MediaIdadeTipoSanguineoDTO>> mediaIdadeTipoSanguineo() async {
    try {
      final response = await http.get(
          Uri.parse(ApiBase.url_base + url + '/media-idade-por-tipo-sanguineo'),
          headers: queryParameters);
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        List<MediaIdadeTipoSanguineoDTO> data =
            List<MediaIdadeTipoSanguineoDTO>.from(
                l.map((model) => MediaIdadeTipoSanguineoDTO.fromJson(model)));
        return data;
      } else {
        throw Exception('Erro ao buscar estatistica.');
      }
    } on Exception catch (exception) {
      print(exception.toString());
      throw Exception('Erro ao fazer a requisição: ${exception}');
    }
  }

  Future<List<QuantidadeDoadoresPorTipoSanguineoDTO>>
      quantidadeDoadoresTipoSanguineo() async {
    try {
      final response = await http.get(
          Uri.parse(ApiBase.url_base +
              url +
              '/quantidade-doadores-por-tipo-sanguineo'),
          headers: queryParameters);
      if (response.statusCode == 200) {
        Iterable l = jsonDecode(response.body);
        List<QuantidadeDoadoresPorTipoSanguineoDTO> data =
            List<QuantidadeDoadoresPorTipoSanguineoDTO>.from(l.map((model) =>
                QuantidadeDoadoresPorTipoSanguineoDTO.fromJson(model)));
        return data;
      } else {
        throw Exception('Erro ao buscar estatistica.');
      }
    } on Exception catch (exception) {
      print(exception.toString());
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

  Future<ObesosPorSexoDTO> percentualObesosPorSexo() async {
    try {
      final response = await http.get(Uri.parse(ApiBase.url_base + url_imc + '/percentual-obesos-por-sexo'),
          headers: queryParameters);
      if (response.statusCode == 200) {
        ObesosPorSexoDTO data = ObesosPorSexoDTO.fromJson(jsonDecode(response.body));
        return data;
      } else {
        throw Exception('Erro ao buscar estatistica.');
      }
    } on Exception catch (exception) {
      print(exception.toString());
      throw Exception('Erro ao fazer a requisição: ${exception}');
    }
  }
}
