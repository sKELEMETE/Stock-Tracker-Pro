// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_quote.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StockQuoteImpl _$$StockQuoteImplFromJson(Map<String, dynamic> json) =>
    _$StockQuoteImpl(
      symbol: json['symbol'] as String,
      current: (json['current'] as num).toDouble(),
      high: (json['high'] as num).toDouble(),
      low: (json['low'] as num).toDouble(),
      open: (json['open'] as num).toDouble(),
      prevClose: (json['prevClose'] as num).toDouble(),
      fetchedAt: json['fetchedAt'] == null
          ? null
          : DateTime.parse(json['fetchedAt'] as String),
    );

Map<String, dynamic> _$$StockQuoteImplToJson(_$StockQuoteImpl instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'current': instance.current,
      'high': instance.high,
      'low': instance.low,
      'open': instance.open,
      'prevClose': instance.prevClose,
      'fetchedAt': instance.fetchedAt?.toIso8601String(),
    };
