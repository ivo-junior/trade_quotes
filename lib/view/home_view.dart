import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trade_quotes/controller/home_controller.dart';
import 'package:trade_quotes/model/ativo_model.dart';
import 'package:trade_quotes/view/bloco.dart';

const double kOverlayBoxWidth = 160.0;
const double kOverlayBoxHeight = 160.0;
const double kOverlayCardWidth = 296.0;
const int kColorMin = 127;

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FinanceQuoteMain(),
    );
  }
}

class FinanceQuoteMain extends StatefulWidget {
  @override
  _FinanceQuoteState createState() => _FinanceQuoteState();
}

class _FinanceQuoteState extends State<FinanceQuoteMain> {
  Bloco bloc1 = Bloco(AtivoModel('IT4U', '15.0', '14.0', '16.0', '13.0',
      '0.35%', '25.000', 'Itau SA', 'BRL'));
  Bloco bloc2 = Bloco(AtivoModel('PETR4', '15.0', '14.0', '16.0', '13.0',
      '0.35%', '25.000', 'Petrobras SA', 'BRL'));
  HomeController controller = HomeController();

  Stream<List<dynamic>> searchItems = Stream.empty();

  final ScrollController scrollController = ScrollController();
  Future searchAssets;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        controller: scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: const Text(
                'Trade Quotes',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Pacifico',
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              expandedHeight: 56.0,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            )
          ];
        },
        body: Builder(
            builder: (context) => RefreshIndicator(
                  displacement: 100.0,
                  onRefresh: () {
                    setState(() {});
                    return Future.delayed(Duration(milliseconds: 100));
                  },
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              StreamBuilder(builder: (c, snapshot) {
                                return Container(
                                  height: 30.0,
                                  child: Text(
                                    snapshot?.data ?? '',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }),
                              Container(
                                child: StreamBuilder(
                                  builder: (c, snapshot) {
                                    return AnimatedCrossFade(
                                      firstChild: Container(
                                          height: 140.0,
                                          margin: EdgeInsets.only(bottom: 8.0),
                                          child: const Center(
                                            child:
                                                const CircularProgressIndicator(),
                                          )),
                                      secondChild: snapshot.hasData
                                          ? Container(
                                              height: 140.0,
                                              margin:
                                                  EdgeInsets.only(bottom: 8.0),
                                              alignment: Alignment.center,
                                              child: Container(
                                                child: Text('123'),
                                              ))
                                          : Container(),
                                      crossFadeState:
                                          (snapshot.connectionState !=
                                                  ConnectionState.done)
                                              ? CrossFadeState.showFirst
                                              : CrossFadeState.showSecond,
                                      duration: Duration(milliseconds: 200),
                                      firstCurve: Curves.easeIn,
                                      secondCurve: Curves.easeIn,
                                    );
                                  },
                                  stream: Stream.empty(),
                                ),
                              ),
                              Container(
                                height: 60,
                                child: StreamBuilder(
                                  builder: (_, snapshot) {
                                    if (snapshot.hasData) {
                                      if (snapshot.data.length != 1) {
                                        return ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (ctx, index) {
                                            var indexItem = snapshot.data[
                                                index % snapshot.data.length];
                                            return Material(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    width:
                                                        kOverlayBoxWidth + 30,
                                                    padding:
                                                        EdgeInsets.all(2.0),
                                                    margin: const EdgeInsets
                                                            .symmetric(
                                                        vertical: 8.0,
                                                        horizontal: 4.0),
                                                    decoration: BoxDecoration(
                                                      color: Theme.of(context)
                                                          .accentColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                            color: const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 0.25),
                                                            blurRadius: 6.0)
                                                      ],
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: <Widget>[
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      4.0),
                                                        ),
                                                        Container(
                                                          width: 32.0,
                                                          height: 32.0,
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle),
                                                          // child:  Icons.add Essa eh a parte do iconezinho do ativo em questao
                                                        ),
                                                        Spacer(),
                                                        Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Container(
                                                              width: 120.0,
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                indexItem[
                                                                    'name'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black87,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 120.0,
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                              child: Text(
                                                                indexItem[
                                                                    'symbol'],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black87,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ));
                                          },
                                        );
                                      } else {
                                        var indexedItem = snapshot.data[0];
                                        return Center(
                                            child: Material(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                child: InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        // 'Symbolo'
                                                      });
                                                    },
                                                    child: Container(
                                                        width:
                                                            kOverlayBoxWidth +
                                                                30,
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        margin: const EdgeInsets
                                                            .all(4.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Theme.of(context)
                                                                  .accentColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: const Color
                                                                        .fromRGBO(
                                                                    0,
                                                                    0,
                                                                    0,
                                                                    0.25),
                                                                blurRadius:
                                                                    6.0),
                                                          ],
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: <Widget>[
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            4.0)),
                                                            Container(
                                                              width: 32.0,
                                                              height: 32.0,
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              //radius: 16.0,
                                                              // child:
                                                            ),
                                                            Spacer(),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  width: 120,
                                                                  alignment:
                                                                      Alignment
                                                                          .centerLeft,
                                                                  child: Text(
                                                                    indexedItem[
                                                                        'name'],
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .black87,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                  ),
                                                                ),
                                                                Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                      indexedItem[
                                                                          'symbol'],
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black87,
                                                                          fontStyle:
                                                                              FontStyle.italic),
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                    )),
                                                              ],
                                                            )
                                                          ],
                                                        )))));
                                      }
                                    } else {
                                      return Center(
                                          child: Text(
                                        "Tipo de Busca",
                                        style: TextStyle(color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                      ));
                                    }
                                  },
                                  stream: searchItems,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverAppBar(
                        floating: true,
                        primary: true,
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.transparent,
                        elevation: 0.0,
                        flexibleSpace: SafeArea(
                            child: Row(children: [
                          Expanded(
                            child: Container(
                                margin: const EdgeInsets.fromLTRB(
                                    16.0, 8.0, 16.0, 4.0),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(48.0)),
                                child: FutureBuilder(
                                  builder: (_, d) {
                                    return TextField(
                                      // controller: _editingController,
                                      // focusNode: _editFocusNode,
                                      textInputAction: TextInputAction.search,
                                      enabled: d.hasData,
                                      onChanged: (s) {
                                        // if (s.isNotEmpty) query.add(s);
                                      },
                                      decoration: InputDecoration(
                                        hintText:
                                            "Pesquise aqui, Futuros | Index | ETF | Crypto",
                                        border: InputBorder.none,
                                        contentPadding:
                                            const EdgeInsets.all(16.0),
                                        //fillColor: Colors.white.withOpacity(0.8),
                                        prefixIcon: d.hasData
                                            ? Icon(Icons.search)
                                            : Icon(Icons.sync),
                                      ),
                                    );
                                  },
                                  future: searchAssets,
                                  initialData: false,
                                )),
                          ),
                        ])),
                        //elevation: 0.0,
                      ),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      _titleSliverBoxSection("ETFs", "ETFs mais rentáveis!"),
                      // _streamHandlerSliverBoxSection(
                      //     listsBloc.gainersListStream, (AsyncSnapshot data) {
                      //   return _marketListBuilder(
                      //       data.data as List<MarketList>, con);
                      // }),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      _titleSliverBoxSection(
                          "Index", "Indices mais volumosos do momento!"),
                      // _streamHandlerSliverBoxSection(
                      //     losersListBloc.losersListStream,
                      //     (AsyncSnapshot data) {
                      //   return _marketListBuilder(
                      //       data.data as List<MarketList>, con);
                      // }),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      _titleSliverBoxSection(
                          "Future", "Items identified as infocus"),
                      // _streamHandlerSliverBoxSection(
                      //     infocusListBloc.infocusListStream,
                      //     (AsyncSnapshot data) {
                      //   return _marketListBuilder(
                      //       data.data as List<MarketList>, con);
                      // }),
                      SliverPadding(
                          padding: EdgeInsets.symmetric(vertical: 8.0)),
                      _titleSliverBoxSection(
                          "Currency", "Paridades mais negociadas!"),
                      // _streamHandlerSliverBoxSection(sectorBloc.sectorStream,
                      //     (AsyncSnapshot data) {
                      //   return sectorsListViewBuilder(
                      //       data.data as List<SectorModel>);
                      // }
                      // ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(vertical: 48.0),
                        sliver: SliverToBoxAdapter(
                          child: Center(
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(4.0),
                              // child: AttributionWidget()
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
      ),
      // body: SafeArea(
      //   child: ListView(
      //     padding: EdgeInsets.all(10),
      //     children: <Widget>[
      //       Text(
      //         'Stocks',
      //         style: TextStyle(fontSize: 50),
      //         textAlign: TextAlign.start,
      //       ),
      //       Row(children: <Widget>[bloc1, bloc2]),
      //       Text(
      //         'ETFs',
      //         style: TextStyle(fontSize: 50),
      //         textAlign: TextAlign.start,
      //       ),
      //       Row(children: <Widget>[bloc1, bloc2]),
      //       Text(
      //         'Future',
      //         style: TextStyle(fontSize: 50),
      //         textAlign: TextAlign.start,
      //       ),
      //       Row(children: <Widget>[bloc1, bloc2]),
      //       Text(
      //         'Index',
      //         style: TextStyle(fontSize: 50),
      //         textAlign: TextAlign.start,
      //       ),
      //       Row(children: <Widget>[bloc1, bloc2]),
      //       Text(
      //         'Currency',
      //         style: TextStyle(fontSize: 50),
      //         textAlign: TextAlign.start,
      //       ),
      //       Row(children: <Widget>[bloc1, bloc2]),
      //     ],
      //   ),
      // )
    );
  }

  Widget _streamHandlerSliverBoxSection(
      Stream sectionStream, Function onDataAvailable) {
    return SliverToBoxAdapter(
      child: Container(
          //color: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.transparent,
          ),
          height: kOverlayBoxHeight + 4.0,
          //margin: EdgeInsets.only(bottom: 50.0),
          child: StreamBuilder(
              stream: sectionStream,
              builder: (context, snapshot) {
                return AnimatedCrossFade(
                    firstCurve: Curves.fastOutSlowIn,
                    secondCurve: Curves.fastOutSlowIn,
                    sizeCurve: Curves.easeIn,
                    // alignment: Alignment.bottomCenter,
                    firstChild:
                        (snapshot.connectionState == ConnectionState.none)
                            ? const Center(
                                child: const Icon(
                                Icons.cloud_off,
                                color: Colors.white,
                                size: 32.0,
                              ))
                            : const Center(
                                child: const CircularProgressIndicator()),
                    secondChild: (!snapshot.hasData
                        ? Center(
                            child: const Icon(
                            Icons.cloud_off,
                            color: Colors.white,
                            size: 32.0,
                          ))
                        : onDataAvailable(snapshot)),
                    crossFadeState:
                        (snapshot.connectionState != ConnectionState.done)
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                    duration: Duration(milliseconds: 900));
              })),
    );
  }

  Widget _titleSliverBoxSection(
    String title,
    String description,
  ) {
    return SliverPadding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        sliver: SliverToBoxAdapter(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            height: 80.0,
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 28.0),
                ),
                const Divider(
                  color: Colors.white70,
                ),
                Text(
                  description,
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ));
  }

  // Widget sectorsListViewBuilder(List<SectorModel> data) {
  //   return ListView.builder(
  //     itemBuilder: (BuildContext c, int i) {
  //       SectorModel index = data[i];
  //       return Material(
  //         color: Colors.transparent,
  //         borderRadius: BorderRadius.circular(8.0),
  //         child: InkWell(
  //           onTap: () {
  //             Navigator.of(context).push(MaterialPageRoute(
  //                 builder: (c) =>
  //                     SectorInformation(index.name, index.performance)));
  //           },
  //           child: Stack(children: [
  //             Container(
  //               width: kOverlayBoxWidth,
  //               margin:
  //                   const EdgeInsets.only(right: 8.0, bottom: 4.0, top: 4.0),
  //               decoration: BoxDecoration(
  //                   color: Theme.of(context).accentColor,
  //                   borderRadius: BorderRadius.circular(8.0),
  //                   boxShadow: [
  //                     BoxShadow(
  //                         color: const Color.fromRGBO(0, 0, 0, 0.25),
  //                         blurRadius: 6.0),
  //                   ],
  //                   image: DecorationImage(
  //                       image: NetworkImage(
  //                           "https://source.unsplash.com/200x200/?${index.name}"),
  //                       alignment: Alignment.center,
  //                       fit: BoxFit.cover)),
  //               child: Center(
  //                 child: Container(
  //                   padding: const EdgeInsets.all(8.0),
  //                   decoration: BoxDecoration(
  //                       color:
  //                           index.performance < 0 ? Colors.red : Colors.green,
  //                       borderRadius: BorderRadius.circular(4.0)),
  //                   child: Text(
  //                     "${(index.performance * 100).toStringAsFixed(2)}%",
  //                     style: TextStyle(
  //                         color: Colors.white70,
  //                         fontWeight: FontWeight.w400,
  //                         fontSize: 20.0),
  //                   ),
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               child: Container(
  //                 alignment: Alignment.bottomCenter,
  //                 padding: const EdgeInsets.symmetric(vertical: 8.0),
  //                 decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.only(
  //                         bottomLeft: Radius.circular(8.0),
  //                         bottomRight: Radius.circular(8.0)),
  //                     color: Colors.white.withOpacity(0.7)),
  //                 width: kOverlayBoxWidth,
  //                 height: 40.0,
  //                 child: Text(
  //                   "${index.name}",
  //                   overflow: TextOverflow.ellipsis,
  //                   maxLines: 1,
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(
  //                     color: Colors.black87,
  //                     fontSize: 16.0,
  //                     fontWeight: FontWeight.bold,
  //                   ),
  //                 ),
  //               ),
  //               bottom: 4.0,
  //             )
  //           ]),
  //         ),
  //       );
  //     },
  //     itemCount: data.length,
  //     physics: const BouncingScrollPhysics(),
  //     padding: const EdgeInsets.only(left: 40.0),
  //     scrollDirection: Axis.horizontal,
  //   );
  // }

  // Widget _marketListBuilder(List<MarketList> gainList, BuildContext con) {
  //   return ListView.builder(
  //     itemCount: gainList.length,
  //     itemBuilder: (BuildContext c, int i) {
  //       Quote index = (gainList[i].quote as Quote);
  //       return GradientColorCard(
  //           kColora: gainList[i].kColora,
  //           kColorb: gainList[i].kColorb,
  //           child: QuoteWidget(
  //             index: index,
  //             allowPushRoute: true,
  //             focusNode: _editFocusNode,
  //             isCrypto: index.sector == "cryptocurrency",
  //             ifIsCrypto: Scaffold.of(con),
  //           ));
  //     },
  //     physics: const BouncingScrollPhysics(),
  //     padding: const EdgeInsets.only(left: 40.0),
  //     scrollDirection: Axis.horizontal,
  //   );
  // }

  String sourceToSimpleString(String src) {
    if (src.contains('Close')) {
      return src;
    } else if (src.contains('IEX')) {
      return "by IEX";
    } else if (src.contains('15')) {
      return "15 min";
    } else {
      return "Previous";
    }
  }

  String numToSimple(dynamic num) {
    if (num == null) {
      return "N/A";
    }
    if (num > 1000000000000) {
      return "${((num / 1000000000) as double).toStringAsFixed(2)} T";
    } else if (num > 1000000000) {
      return "${((num / 1000000000) as double).toStringAsFixed(2)} B";
    } else if (num > 1000000) {
      return "${((num / 1000000) as double).toStringAsFixed(2)} M";
    } else if (num > 1000) {
      return "${((num / 1000) as double).toStringAsFixed(2)} K";
    } else {
      if (num is int) {
        return num.toDouble().toStringAsFixed(2);
      }
      return (num as double)?.toStringAsFixed(2);
    }
  }
}

// class AttributionWidget extends StatelessWidget {
//   void _launchURL(BuildContext context, String site) async {
//     try {
//       await launch(
//         site,
//         option: new CustomTabsOption(
//           toolbarColor: Theme.of(context).primaryColor,
//           enableDefaultShare: true,
//           enableUrlBarHiding: true,
//           showPageTitle: true,
//           animation: new CustomTabsAnimation.slideIn(),
//           // or user defined animation.
//           extraCustomTabs: <String>[
//             // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
//             'org.mozilla.firefox',
//             // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
//             'com.microsoft.emmx',
//           ],
//         ),
//       );
//     } catch (e) {
//       // An exception is thrown if browser app is not installed on Android device.
//       debugPrint(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//           text: "Data provided for free by ",
//           style: TextStyle(fontFamily: 'Montserrat'),
//           children: [
//             TextSpan(
//                 text: "IEX.",
//                 style: TextStyle(decoration: TextDecoration.underline),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () =>
//                       _launchURL(context, "https://iextrading.com/developer")),
//             TextSpan(text: " View", children: []),
//             TextSpan(
//                 text: " IEX’s Terms of Use",
//                 style: TextStyle(decoration: TextDecoration.underline),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () => _launchURL(
//                       context, "https://iextrading.com/api-exhibit-a/"))
//           ]),
//     );
//   }
// }
