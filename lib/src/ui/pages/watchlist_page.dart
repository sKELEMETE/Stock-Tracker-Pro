// lib/src/pages/watchlist_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/stock_detail/stock_detail_bloc.dart';
import '../../blocs/stock_detail/stock_detail_event.dart';
import '../../models/watchlist_item.dart';
import '../widgets/price_tile.dart';
import '../../repositories/stock_repository.dart';
import '../../../constants/colors.dart';
import '../pages/stock_detail_page.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({super.key});

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  List<WatchlistItem> allStocks = [];
  List<WatchlistItem> visibleStocks = [];
  List<WatchlistItem> popularStocks = [];

  int _loadedCount = 20;
  final int _chunkSize = 20;
  bool _loadingStocks = true;

  @override
  void initState() {
    super.initState();
    _initPopularStocks();
    _fetchAllStocks();

    _scrollController.addListener(_onScroll);
    _searchController.addListener(_onSearchChanged);
  }

  void _initPopularStocks() {
    popularStocks = [
      WatchlistItem(symbol: 'AAPL', name: 'Apple Inc'),
      WatchlistItem(symbol: 'MSFT', name: 'Microsoft Corp'),
      WatchlistItem(symbol: 'GOOGL', name: 'Alphabet Inc'),
      WatchlistItem(symbol: 'AMZN', name: 'Amazon.com Inc'),
      WatchlistItem(symbol: 'TSLA', name: 'Tesla Inc'),
    ];
  }

  Future<void> _fetchAllStocks() async {
    final repo = RepositoryProvider.of<StockRepository>(context, listen: false);
    final symbols = await repo.getAllSymbols();
    if (!mounted) return;
    setState(() {
      allStocks = symbols
          .map((s) => WatchlistItem(symbol: s['symbol']!, name: s['name']!))
          .toList();
      visibleStocks = allStocks.take(_loadedCount).toList();
      _loadingStocks = false;
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _loadMore();
    }
  }

  void _loadMore() {
    if (_loadedCount >= allStocks.length) return;
    setState(() {
      _loadedCount += _chunkSize;
      visibleStocks = allStocks.take(_loadedCount).toList();
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      visibleStocks = allStocks
          .where((s) =>
              s.name.toLowerCase().contains(query) ||
              s.symbol.toLowerCase().contains(query))
          .take(_loadedCount)
          .toList();
    });
  }

  void _goToStockDetail(WatchlistItem stock) {
    final repo = RepositoryProvider.of<StockRepository>(context, listen: false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => StockDetailBloc(repository: repo)
            ..add(LoadStockDetail(stock.symbol)),
          child: StockDetailPage(symbol: stock.symbol),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBg,
      appBar: AppBar(title: const Text('Watchlist')),
      body: Column(
        children: [
          // Search
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search stocks...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          // Popular horizontal stocks
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: popularStocks.length,
              itemBuilder: (context, index) {
                final stock = popularStocks[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ActionChip(
                    backgroundColor: AppColors.electricBlue.withOpacity(0.1),
                    label: Text(stock.symbol,
                        style: const TextStyle(
                            color: AppColors.electricBlue,
                            fontWeight: FontWeight.bold)),
                    onPressed: () => _goToStockDetail(stock),
                  ),
                );
              },
            ),
          ),
          // Stock list
          Expanded(
            child: _loadingStocks
                ? const Center(child: CircularProgressIndicator())
                : RefreshIndicator(
                    onRefresh: _fetchAllStocks,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: visibleStocks.length,
                      itemBuilder: (context, index) {
                        final stock = visibleStocks[index];
                        return PriceTile(
                            symbol: stock.symbol, name: stock.name);
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
