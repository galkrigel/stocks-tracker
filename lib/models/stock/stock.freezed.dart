// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Stock {
  String get name => throw _privateConstructorUsedError;
  String get ticker => throw _privateConstructorUsedError;
  double get currentPrice => throw _privateConstructorUsedError;
  double get previousClose => throw _privateConstructorUsedError;
  String get logoUrl => throw _privateConstructorUsedError;
  double get high => throw _privateConstructorUsedError;
  double get low => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  double get percentageChange => throw _privateConstructorUsedError;
  List<FlSpot> get priceHistory => throw _privateConstructorUsedError;
  String get exchange => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StockCopyWith<Stock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StockCopyWith<$Res> {
  factory $StockCopyWith(Stock value, $Res Function(Stock) then) =
      _$StockCopyWithImpl<$Res, Stock>;
  @useResult
  $Res call(
      {String name,
      String ticker,
      double currentPrice,
      double previousClose,
      String logoUrl,
      double high,
      double low,
      String currency,
      double percentageChange,
      List<FlSpot> priceHistory,
      String exchange});
}

/// @nodoc
class _$StockCopyWithImpl<$Res, $Val extends Stock>
    implements $StockCopyWith<$Res> {
  _$StockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? currentPrice = null,
    Object? previousClose = null,
    Object? logoUrl = null,
    Object? high = null,
    Object? low = null,
    Object? currency = null,
    Object? percentageChange = null,
    Object? priceHistory = null,
    Object? exchange = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      previousClose: null == previousClose
          ? _value.previousClose
          : previousClose // ignore: cast_nullable_to_non_nullable
              as double,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      percentageChange: null == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double,
      priceHistory: null == priceHistory
          ? _value.priceHistory
          : priceHistory // ignore: cast_nullable_to_non_nullable
              as List<FlSpot>,
      exchange: null == exchange
          ? _value.exchange
          : exchange // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StockImplCopyWith<$Res> implements $StockCopyWith<$Res> {
  factory _$$StockImplCopyWith(
          _$StockImpl value, $Res Function(_$StockImpl) then) =
      __$$StockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String ticker,
      double currentPrice,
      double previousClose,
      String logoUrl,
      double high,
      double low,
      String currency,
      double percentageChange,
      List<FlSpot> priceHistory,
      String exchange});
}

/// @nodoc
class __$$StockImplCopyWithImpl<$Res>
    extends _$StockCopyWithImpl<$Res, _$StockImpl>
    implements _$$StockImplCopyWith<$Res> {
  __$$StockImplCopyWithImpl(
      _$StockImpl _value, $Res Function(_$StockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? ticker = null,
    Object? currentPrice = null,
    Object? previousClose = null,
    Object? logoUrl = null,
    Object? high = null,
    Object? low = null,
    Object? currency = null,
    Object? percentageChange = null,
    Object? priceHistory = null,
    Object? exchange = null,
  }) {
    return _then(_$StockImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ticker: null == ticker
          ? _value.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as String,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      previousClose: null == previousClose
          ? _value.previousClose
          : previousClose // ignore: cast_nullable_to_non_nullable
              as double,
      logoUrl: null == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as double,
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      percentageChange: null == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double,
      priceHistory: null == priceHistory
          ? _value._priceHistory
          : priceHistory // ignore: cast_nullable_to_non_nullable
              as List<FlSpot>,
      exchange: null == exchange
          ? _value.exchange
          : exchange // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StockImpl extends _Stock {
  const _$StockImpl(
      {required this.name,
      required this.ticker,
      required this.currentPrice,
      required this.previousClose,
      required this.logoUrl,
      required this.high,
      required this.low,
      required this.currency,
      required this.percentageChange,
      required final List<FlSpot> priceHistory,
      required this.exchange})
      : _priceHistory = priceHistory,
        super._();

  @override
  final String name;
  @override
  final String ticker;
  @override
  final double currentPrice;
  @override
  final double previousClose;
  @override
  final String logoUrl;
  @override
  final double high;
  @override
  final double low;
  @override
  final String currency;
  @override
  final double percentageChange;
  final List<FlSpot> _priceHistory;
  @override
  List<FlSpot> get priceHistory {
    if (_priceHistory is EqualUnmodifiableListView) return _priceHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceHistory);
  }

  @override
  final String exchange;

  @override
  String toString() {
    return 'Stock(name: $name, ticker: $ticker, currentPrice: $currentPrice, previousClose: $previousClose, logoUrl: $logoUrl, high: $high, low: $low, currency: $currency, percentageChange: $percentageChange, priceHistory: $priceHistory, exchange: $exchange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StockImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.previousClose, previousClose) ||
                other.previousClose == previousClose) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.percentageChange, percentageChange) ||
                other.percentageChange == percentageChange) &&
            const DeepCollectionEquality()
                .equals(other._priceHistory, _priceHistory) &&
            (identical(other.exchange, exchange) ||
                other.exchange == exchange));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      ticker,
      currentPrice,
      previousClose,
      logoUrl,
      high,
      low,
      currency,
      percentageChange,
      const DeepCollectionEquality().hash(_priceHistory),
      exchange);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      __$$StockImplCopyWithImpl<_$StockImpl>(this, _$identity);
}

abstract class _Stock extends Stock {
  const factory _Stock(
      {required final String name,
      required final String ticker,
      required final double currentPrice,
      required final double previousClose,
      required final String logoUrl,
      required final double high,
      required final double low,
      required final String currency,
      required final double percentageChange,
      required final List<FlSpot> priceHistory,
      required final String exchange}) = _$StockImpl;
  const _Stock._() : super._();

  @override
  String get name;
  @override
  String get ticker;
  @override
  double get currentPrice;
  @override
  double get previousClose;
  @override
  String get logoUrl;
  @override
  double get high;
  @override
  double get low;
  @override
  String get currency;
  @override
  double get percentageChange;
  @override
  List<FlSpot> get priceHistory;
  @override
  String get exchange;
  @override
  @JsonKey(ignore: true)
  _$$StockImplCopyWith<_$StockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
