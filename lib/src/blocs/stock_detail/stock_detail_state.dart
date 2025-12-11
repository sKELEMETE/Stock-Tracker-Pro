import 'package:equatable/equatable.dart';
import '../../models/stock_quote.dart';
import '../../models/news_article.dart';

abstract class StockDetailState extends Equatable {
  const StockDetailState();
  @override
  List<Object?> get props => [];
}

class StockDetailLoading extends StockDetailState {}

class StockDetailLoaded extends StockDetailState {
  final StockQuote? quote;
  final List<NewsArticle> news;
  const StockDetailLoaded({required this.quote, required this.news});
  @override
  List<Object?> get props => [quote ?? '', news];
}

class StockDetailError extends StockDetailState {
  final String message;
  const StockDetailError(this.message);
  @override
  List<Object?> get props => [message];
}
