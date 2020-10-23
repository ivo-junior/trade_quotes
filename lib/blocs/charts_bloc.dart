import 'dart:async';

import 'package:trade_quotes/models/charts.dart' as Charts;
import 'package:trade_quotes/network/api_reques.dart' as IEX;

class ChartsBloc {
  final IEX.IexApiProxy _iexApiProxy;
  final String symbol;
  Stream<Charts.ChartModel> chartsStream = Stream.empty();

  ChartsBloc(this._iexApiProxy, this.symbol,
      [int intervals = 1,
      Charts.ChartDurations duration = Charts.ChartDurations.THREE_MONTHS]) {
    chartsStream =
        _iexApiProxy.fetchChartData(symbol, duration, intervals).asStream();
  }

  void fetchDifferentDuration(Charts.ChartDurations newDuration) {
    chartsStream = _iexApiProxy.fetchChartData(symbol, newDuration).asStream();
  }

  void fetchDifferentDurationIntervals(
      Charts.ChartDurations newDuration, int interval) {
    chartsStream =
        _iexApiProxy.fetchChartData(symbol, newDuration, interval).asStream();
  }
}
