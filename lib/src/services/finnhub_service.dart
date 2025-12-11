import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stock_quote.dart';
import '../models/news_article.dart';

class FinnhubService {
  final String apiKey;
  final http.Client httpClient;

  FinnhubService({required this.apiKey, http.Client? client})
      : httpClient = client ?? http.Client();

  Future<StockQuote?> fetchQuote(String symbol) async {
    final url = Uri.https(
        'finnhub.io', '/api/v1/quote', {'symbol': symbol, 'token': apiKey});
    final res = await httpClient.get(url);
    if (res.statusCode != 200) return null;
    final body = json.decode(res.body) as Map<String, dynamic>;
    return StockQuote(
      symbol: symbol,
      current: (body['c'] as num).toDouble(),
      high: (body['h'] as num).toDouble(),
      low: (body['l'] as num).toDouble(),
      open: (body['o'] as num).toDouble(),
      prevClose: (body['pc'] as num).toDouble(),
      fetchedAt: DateTime.now(),
    );
  }

  Future<List<NewsArticle>> fetchCompanyNews(String symbol) async {
    final to = DateTime.now();
    final from = to.subtract(const Duration(days: 7));
    final params = {
      'symbol': symbol,
      'from': from.toIso8601String().split('T').first,
      'to': to.toIso8601String().split('T').first,
      'token': apiKey,
    };
    final url = Uri.https('finnhub.io', '/api/v1/company-news', params);
    final res = await httpClient.get(url);
    if (res.statusCode != 200) return [];
    final arr = json.decode(res.body) as List<dynamic>;
    return arr.map((e) {
      final map = e as Map<String, dynamic>;
      return NewsArticle(
        id: (map['id'] ?? '').toString(),
        headline: map['headline'] ?? '',
        source: map['source'] ?? '',
        url: map['url'] ?? '',
        datetime:
            DateTime.fromMillisecondsSinceEpoch((map['datetime'] ?? 0) * 1000),
      );
    }).toList();
  }

  // Fetch all US stock symbols
  Future<List<Map<String, String>>> fetchAllSymbols(
      {String exchange = 'US'}) async {
    final url = Uri.https(
      'finnhub.io',
      '/api/v1/stock/symbol',
      {'exchange': exchange, 'token': apiKey},
    );
    final res = await httpClient.get(url);
    if (res.statusCode != 200) return [];

    final data = json.decode(res.body) as List<dynamic>;

    return data.map((e) {
      final map = e as Map<String, dynamic>; // cast each element
      return {
        'symbol': (map['symbol'] ?? '').toString(),
        'name': (map['description'] ?? '').toString(),
      };
    }).toList();
  }
}
