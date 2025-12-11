import 'package:freezed_annotation/freezed_annotation.dart';
part 'stock_quote.freezed.dart';
part 'stock_quote.g.dart';

@freezed
class StockQuote with _$StockQuote {
  factory StockQuote({
    required String symbol,
    required double current,
    required double high,
    required double low,
    required double open,
    required double prevClose,
    DateTime? fetchedAt,
  }) = _StockQuote;

  factory StockQuote.fromJson(Map<String, dynamic> json) =>
      _$StockQuoteFromJson(json);
}
