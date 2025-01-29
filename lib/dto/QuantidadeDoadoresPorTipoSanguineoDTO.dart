class QuantidadeDoadoresPorTipoSanguineoDTO {
  final String tipoSanguineo;
  final String receber;
  final int quantidade;

  QuantidadeDoadoresPorTipoSanguineoDTO(
      {required this.tipoSanguineo, required this.receber, required this.quantidade});

  factory QuantidadeDoadoresPorTipoSanguineoDTO.fromJson(Map<String, dynamic> json) {
    return QuantidadeDoadoresPorTipoSanguineoDTO(
        tipoSanguineo: json['tipoSanguineo'],
        receber: json['receber'],
        quantidade: json['quantidade']);
    }
}
