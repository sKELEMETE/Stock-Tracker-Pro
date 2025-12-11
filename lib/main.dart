// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app.dart';
import 'src/persistence/hive_boxes.dart';
import 'src/services/finnhub_service.dart';
import 'src/repositories/stock_repository.dart';
import 'src/models/watchlist_item.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await registerAdapters();
  await openBoxes();

  // Finnhub API key
  final apiKey =
      const String.fromEnvironment('FINNHUB_API_KEY', defaultValue: '');
  final finnhubService = FinnhubService(apiKey: apiKey);
  final repo = StockRepository(api: finnhubService);

  // Populate default watchlist if empty
  await populateDefaultWatchlist(repo);

  // Provide repository above entire app
  runApp(
    RepositoryProvider<StockRepository>.value(
      value: repo,
      child: const StockTrackerApp(),
    ),
  );
}

// Populate some default stocks
Future<void> populateDefaultWatchlist(StockRepository repo) async {
  final existing = repo.getWatchlist();
  if (existing.isEmpty) {
    final defaults = [
      WatchlistItem(symbol: 'AAPL', name: 'Apple Inc'),
      WatchlistItem(symbol: 'MSFT', name: 'Microsoft Corp'),
      WatchlistItem(symbol: 'GOOGL', name: 'Alphabet Inc'),
      WatchlistItem(symbol: 'AMZN', name: 'Amazon.com Inc'),
      WatchlistItem(symbol: 'TSLA', name: 'Tesla Inc'),
    ];
    for (var item in defaults) {
      await repo.addToWatchlist(item);
    }
  }
}
