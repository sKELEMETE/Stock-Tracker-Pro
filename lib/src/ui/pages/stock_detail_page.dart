import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/stock_detail/stock_detail_bloc.dart';
import '../../blocs/stock_detail/stock_detail_event.dart';
import '../../blocs/stock_detail/stock_detail_state.dart';
import '../widgets/price_chart.dart';
import '../widgets/news_card.dart';

class StockDetailPage extends StatefulWidget {
  final String symbol;
  const StockDetailPage({super.key, required this.symbol});

  @override
  State<StockDetailPage> createState() => _StockDetailPageState();
}

class _StockDetailPageState extends State<StockDetailPage> {
  @override
  void initState() {
    super.initState();
    // Request load via injected bloc
    final bloc = BlocProvider.of<StockDetailBloc>(context, listen: false);
    bloc.add(LoadStockDetail(widget.symbol));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.symbol)),
      body: BlocBuilder<StockDetailBloc, StockDetailState>(
        builder: (context, state) {
          if (state is StockDetailLoading)
            return const Center(child: CircularProgressIndicator());
          if (state is StockDetailLoaded) {
            final q = state.quote;
            final news = state.news;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (q != null) ...[
                    Text(q.symbol,
                        style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 8),
                    Text(q.current.toStringAsFixed(2),
                        style: const TextStyle(
                            fontSize: 28, fontFamily: 'RobotoMono')),
                    const SizedBox(height: 16),
                  ],
                  const SizedBox(height: 8),
                  SizedBox(
                      height: 200, child: PriceChart(symbol: widget.symbol)),
                  const SizedBox(height: 16),
                  const Text('Related News', style: TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Expanded(
                    child: news.isEmpty
                        ? const Center(child: Text('No news'))
                        : ListView.builder(
                            itemCount: news.length,
                            itemBuilder: (context, i) =>
                                NewsCard(article: news[i]),
                          ),
                  )
                ],
              ),
            );
          }
          if (state is StockDetailError)
            return Center(child: Text('Error: ${state.message}'));
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
