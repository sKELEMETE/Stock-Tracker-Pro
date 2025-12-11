import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/watchlist/watchlist_bloc.dart';
import '../../blocs/watchlist/watchlist_event.dart';
import '../../blocs/watchlist/watchlist_state.dart';
import '../../models/watchlist_item.dart';
import '../widgets/price_tile.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});
  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  @override
  void initState() {
    super.initState();
    // Load existing watchlist
    final bloc = context.read<WatchlistBloc>();
    bloc.add(LoadWatchlist());

    // Auto-add default stocks if watchlist is empty
    bloc.stream.firstWhere((state) => state is WatchlistLoaded).then((state) {
      if (state is WatchlistLoaded && state.items.isEmpty) {
        final defaultStocks = [
          WatchlistItem(symbol: 'AAPL', name: 'Apple Inc'),
          WatchlistItem(symbol: 'MSFT', name: 'Microsoft Corp'),
          WatchlistItem(symbol: 'GOOGL', name: 'Alphabet Inc'),
          WatchlistItem(symbol: 'AMZN', name: 'Amazon.com Inc'),
          WatchlistItem(symbol: 'TSLA', name: 'Tesla Inc'),
        ];
        for (var item in defaultStocks) {
          bloc.add(AddWatchlistItem(item));
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          if (state is WatchlistLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is WatchlistLoaded) {
            if (state.items.isEmpty) {
              return const Center(child: Text('No data'));
            }
            return ListView.builder(
              itemCount: state.items.length,
              itemBuilder: (context, i) {
                final item = state.items[i];
                return Dismissible(
                  key: Key('${item.symbol}-$i'),
                  onDismissed: (_) =>
                      context.read<WatchlistBloc>().add(RemoveWatchlistItem(i)),
                  child: PriceTile(symbol: item.symbol, name: item.name),
                );
              },
            );
          }
          return const Center(child: Text('No data'));
        },
      ),
    );
  }
}
