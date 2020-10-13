class AtivoModel {
  String siglaAtivo,
      precoAtual,
      baixaDia,
      altaDia,
      abertura,
      mudanca,
      volume,
      nomeAtivo,
      moedaCompra;

  AtivoModel(
      String siglaAtivo,
      String precoAtual,
      String baixaDia,
      String altaDia,
      String abertura,
      String mudanca,
      String volume,
      String nomeAtivo,
      String moedaCompra) {
    this.siglaAtivo = siglaAtivo;
    this.precoAtual = precoAtual;
    this.baixaDia = baixaDia;
    this.altaDia = altaDia;
    this.abertura = abertura;
    this.mudanca = mudanca;
    this.volume = volume;
    this.nomeAtivo = nomeAtivo;
    this.moedaCompra = moedaCompra;
  }
}
