import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/animation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_banco_sangue/api/DoadorApi.dart';
import 'package:flutter_banco_sangue/screen/quantidade_doadores_tipo_sanguineo.dart';

import '../domain/Doador.dart';
import '../dto/DoadoresPorEstadoDTO.dart';
import '../dto/MediaIdadeTipoSanguineoDTO.dart';
import '../dto/ObesosPorSexoDTO.dart';
import '../dto/QuantidadeDoadoresPorTipoSanguineoDTO.dart';

class DoadorService {


  DoadorApi doadorApi = new DoadorApi();

  Future<List<Doador>> loadJson() async {
    String data = await rootBundle.loadString('assets/data.json');
    List<dynamic> jsonResult = jsonDecode(data);
    List<Doador> doadores = List<Doador>.from(jsonResult.map((model)=> Doador.fromJson(model)));
    return doadorApi.salvar(doadores);
  }

  Future<List<Doador>> buscarTodos() async {
    return doadorApi.buscarTodos();
  }

  Future<List<DoadoresPorEstadoDTO>> doadoresPorEstado() async {
    return doadorApi.doadoresPorEstado();
  }

  Future<List<MediaIdadeTipoSanguineoDTO>> mediaIdadeTipoSanguineo() async {
    return doadorApi.mediaIdadeTipoSanguineo();
  }

  Future<List<QuantidadeDoadoresPorTipoSanguineoDTO>> quantidadeDoadoresTipoSanguineo() async {
    return doadorApi.quantidadeDoadoresTipoSanguineo();
  }

  Future<ObesosPorSexoDTO> percentualObesosPorSexo() async {
    return doadorApi.percentualObesosPorSexo();
  }
}
