class ObesosPorSexoDTO {
  final double percentualMasculino;
  final double percentualFeminino;

  ObesosPorSexoDTO(
      {required this.percentualMasculino, required this.percentualFeminino});

  factory ObesosPorSexoDTO.fromJson(Map<String, dynamic> json) {
    return ObesosPorSexoDTO(
        percentualMasculino: json['percentualMasculino'],
        percentualFeminino: json['percentualFeminino']);
  }
}