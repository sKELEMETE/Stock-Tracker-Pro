import '../models/stock_quote.dart';
import '../models/news_article.dart';
import '../services/finnhub_service.dart';
import 'package:hive/hive.dart';
import '../persistence/hive_boxes.dart';
import '../models/watchlist_item.dart';

class StockRepository {
  final FinnhubService api;
  final Box<WatchlistItem> box;

  StockRepository({required this.api})
      : box = Hive.box<WatchlistItem>(kWatchlistBox);

  Future<StockQuote?> getQuote(String symbol) async {
    return await api.fetchQuote(symbol);
  }

  Future<List<NewsArticle>> getNews(String symbol) async {
    return await api.fetchCompanyNews(symbol);
  }

  List<WatchlistItem> getWatchlist() {
    return box.values.toList();
  }

  Future<void> addToWatchlist(WatchlistItem item) async {
    await box.add(item);
  }

  Future<void> removeFromWatchlist(int index) async {
    await box.deleteAt(index);
  }

  Future<List<Map<String, String>>> getAllSymbols() async {
    return await api.fetchAllSymbols();
  }
}
