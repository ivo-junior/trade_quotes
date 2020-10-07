import 'package:trade_quotes/model/ativo_list_model.dart';
import 'package:trade_quotes/model/ativo_model.dart';
import 'package:trade_quotes/network/api_reques.dart';

class HomeController {
  var api = ApiReques();
  var itau = AtivoModel(AtivoListModel().nomesAtivos[2].toString());
  var klb = AtivoModel(AtivoListModel().nomesAtivos[0].toString());
  var petro = AtivoModel(AtivoListModel().nomesAtivos[1].toString());

  HomeController() {
    api.infoAtivo(itau, itau.siglaAtivo);
    api.infoAtivo(klb, klb.siglaAtivo);
    api.infoAtivo(petro, petro.siglaAtivo);

    print(itau.abertura);
    print(itau.precoAtual);
    print(klb.abertura);
    print(klb.precoAtual);
    print(petro.abertura);
    print(petro.precoAtual);
    // print("Preço Fechamento Itau$itau\n");
    // print("Preço atual Itau$itau.abertura\n");
  }
}
