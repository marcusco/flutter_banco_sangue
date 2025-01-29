class DoadoresPorEstadoDTO {
  final String estado;
  final int quantidade;

  DoadoresPorEstadoDTO(
      {required this.estado, required this.quantidade});

  factory DoadoresPorEstadoDTO.fromJson(Map<String, dynamic> json) {
    return DoadoresPorEstadoDTO(
        estado: json['estado'],
        quantidade: json['quantidade']);
    }
}
