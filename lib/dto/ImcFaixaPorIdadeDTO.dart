class ImcFaixaPorIdadeDTO {
  String faixa;
  double somaImc;
  double mediaImc;
  double quantidade;

  ImcFaixaPorIdadeDTO(
      {required this.faixa,
      required this.somaImc,
      required this.mediaImc,
      required this.quantidade});

  factory ImcFaixaPorIdadeDTO.fromJson(Map<String, dynamic> json) {
    return ImcFaixaPorIdadeDTO(
        faixa: json['faixa'],
        somaImc: json['somaImc'],
        mediaImc: json['mediaImc'],
        quantidade: json['quantidade']);
  }
}
