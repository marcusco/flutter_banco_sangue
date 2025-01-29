import 'dart:ffi';

class MediaIdadeTipoSanguineoDTO {
  final String tipoSanguineo;
  final double mediaIdade;

  MediaIdadeTipoSanguineoDTO(
      {required this.tipoSanguineo, required this.mediaIdade});

  factory MediaIdadeTipoSanguineoDTO.fromJson(Map<String, dynamic> json) {
    return MediaIdadeTipoSanguineoDTO(
        tipoSanguineo: json['tipoSanguineo'], mediaIdade: json['mediaIdade']);
  }
}
