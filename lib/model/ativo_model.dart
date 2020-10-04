class AtivoModel {
  String siglaAtivo;
  String precoAtual = "",
      baixaDia = "",
      altaDia = "",
      abertura = "",
      mudanca = "",
      volume = "",
      nomeAtivo = "",
      moedaCompra = "";

  AtivoModel(String siglaAtivo) {
    this.siglaAtivo = siglaAtivo;
  }
}
