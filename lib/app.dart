import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'src/ui/pages/home_page.dart';
import 'src/blocs/watchlist/watchlist_bloc.dart';
import 'src/blocs/watchlist/watchlist_event.dart';
import 'src/blocs/news/news_bloc.dart';
import 'src/blocs/news/news_event.dart';
import 'src/repositories/stock_repository.dart';

class StockTrackerApp extends StatelessWidget {
  const StockTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get repository from RepositoryProvider
    final repository = RepositoryProvider.of<StockRepository>(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<WatchlistBloc>(
          create: (_) =>
              WatchlistBloc(repository: repository)..add(LoadWatchlist()),
        ),
        BlocProvider<NewsBloc>(
          create: (_) =>
              NewsBloc(repository: repository)..add(LoadMarketNews()),
        ),
      ],
      child: MaterialApp(
        title: 'Stock Tracker Pro',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomePage(),
      ),
    );
  }
}
