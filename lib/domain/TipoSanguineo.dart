import 'dart:ffi';

class TipoSanguineo {
  final Long? id;
  final String? codigo;
  final String? doar;
  final String? receber;

  TipoSanguineo({this.id, this.codigo, this.doar, this.receber});

  factory TipoSanguineo.fromJson(Map<String, dynamic> json) {
    return TipoSanguineo(
        id: json['id'],
        codigo: json['codigo'],
        doar: json['doar'],
        receber: json['receber']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['codigo'] = codigo;
    data['doar'] = doar;
    data['receber'] = receber;

    return data;
  }
}
