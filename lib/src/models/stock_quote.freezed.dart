// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock_quote.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StockQuote _$StockQuoteFromJson(Map<String, dynamic> json) {
  return _StockQuote.fromJson(json);
}

/// @nodoc
mixin _$StockQuote {
  String get symbol => throw _privateConstructorUsedError;
  double get current => throw _privateConstructorUsedError;
  double get high => throw _privateConstructorUsedError;
  double get low => throw _privateConstructorUsedError;
  double get open => throw _privateConstructorUsedError;
  double get prevClose => throw _privateConstructorUsedError;
  DateTime? get fetchedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StockQuoteCopyWith<StockQuote> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockQuoteCopyWith<$Res> {
  factory $StockQuoteCopyWith(
          StockQuote value, $Res Function(StockQuote) then) =
      _$StockQuoteCopyWithImpl<$Res, StockQuote>;
  @useResult
  $Res call(
      {String symbol,
      double current,
      double high,
      double low,
      double open,
      double prevClose,
      DateTime? fetchedAt});
}

/// @nodoc
class _$StockQuoteCopyWithImpl<$Res, $Val extends StockQuote>
    implements $StockQuoteCopyWith<$Res> {
  _$StockQuoteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? current = null,
    Object? high = null,
    Object? low = null,
    Object? open = null,
    Object? prevClose = null,
    Object? fetchedAt = freezed,
  }) {
    return _then(_value.copyWith(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      prevClose: null == prevClose
          ? _value.prevClose
          : prevClose // ignore: cast_nullable_to_non_nullable
              as double,
      fetchedAt: freezed == fetchedAt
          ? _value.fetchedAt
          : fetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockQuoteImplCopyWith<$Res>
    implements $StockQuoteCopyWith<$Res> {
  factory _$$StockQuoteImplCopyWith(
          _$StockQuoteImpl value, $Res Function(_$StockQuoteImpl) then) =
      __$$StockQuoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String symbol,
      double current,
      double high,
      double low,
      double open,
      double prevClose,
      DateTime? fetchedAt});
}

/// @nodoc
class __$$StockQuoteImplCopyWithImpl<$Res>
    extends _$StockQuoteCopyWithImpl<$Res, _$StockQuoteImpl>
    implements _$$StockQuoteImplCopyWith<$Res> {
  __$$StockQuoteImplCopyWithImpl(
      _$StockQuoteImpl _value, $Res Function(_$StockQuoteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? symbol = null,
    Object? current = null,
    Object? high = null,
    Object? low = null,
    Object? open = null,
    Object? prevClose = null,
    Object? fetchedAt = freezed,
  }) {
    return _then(_$StockQuoteImpl(
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as double,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      open: null == open
          ? _value.open
          : open // ignore: cast_nullable_to_non_nullable
              as double,
      prevClose: null == prevClose
          ? _value.prevClose
          : prevClose // ignore: cast_nullable_to_non_nullable
              as double,
      fetchedAt: freezed == fetchedAt
          ? _value.fetchedAt
          : fetchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StockQuoteImpl implements _StockQuote {
  _$StockQuoteImpl(
      {required this.symbol,
      required this.current,
      required this.high,
      required this.low,
      required this.open,
      required this.prevClose,
      this.fetchedAt});

  factory _$StockQuoteImpl.fromJson(Map<String, dynamic> json) =>
      _$$StockQuoteImplFromJson(json);

  @override
  final String symbol;
  @override
  final double current;
  @override
  final double high;
  @override
  final double low;
  @override
  final double open;
  @override
  final double prevClose;
  @override
  final DateTime? fetchedAt;

  @override
  String toString() {
    return 'StockQuote(symbol: $symbol, current: $current, high: $high, low: $low, open: $open, prevClose: $prevClose, fetchedAt: $fetchedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockQuoteImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.open, open) || other.open == open) &&
            (identical(other.prevClose, prevClose) ||
                other.prevClose == prevClose) &&
            (identical(other.fetchedAt, fetchedAt) ||
                other.fetchedAt == fetchedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, symbol, current, high, low, open, prevClose, fetchedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockQuoteImplCopyWith<_$StockQuoteImpl> get copyWith =>
      __$$StockQuoteImplCopyWithImpl<_$StockQuoteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StockQuoteImplToJson(
      this,
    );
  }
}

abstract class _StockQuote implements StockQuote {
  factory _StockQuote(
      {required final String symbol,
      required final double current,
      required final double high,
      required final double low,
      required final double open,
      required final double prevClose,
      final DateTime? fetchedAt}) = _$StockQuoteImpl;

  factory _StockQuote.fromJson(Map<String, dynamic> json) =
      _$StockQuoteImpl.fromJson;

  @override
  String get symbol;
  @override
  double get current;
  @override
  double get high;
  @override
  double get low;
  @override
  double get open;
  @override
  double get prevClose;
  @override
  DateTime? get fetchedAt;
  @override
  @JsonKey(ignore: true)
  _$$StockQuoteImplCopyWith<_$StockQuoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
