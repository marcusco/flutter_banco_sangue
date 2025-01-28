import 'dart:convert';

import 'package:flutter_banco_sangue/api/ApiBase.dart';
import 'package:flutter_banco_sangue/domain/TipoSanguineo.dart';

import 'package:http/http.dart' as http;

class TipoSanguineoApi extends ApiBase {
  static const url = 'api/tipo-sanguineo';

  Future<List<TipoSanguineo>> salvarTipo() async {
    try {
      final response = await http.get(Uri.parse(ApiBase.url_base + url),
          headers: queryParameters);
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Sem dados a listar.');
      }
    } on Exception catch (exception) {
      throw Exception('Erro ao fazer a requisição: $exception');
    }
  }
}
