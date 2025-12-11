// lib/src/widgets/price_tile.dart
import 'package:flutter/material.dart';
import '../../models/stock_quote.dart';
import '../../repositories/stock_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/stock_detail_page.dart';
import '../../blocs/stock_detail/stock_detail_bloc.dart';
import '../../blocs/stock_detail/stock_detail_event.dart';
import '../../../constants/colors.dart';

class PriceTile extends StatefulWidget {
  final String symbol;
  final String name;
  const PriceTile({super.key, required this.symbol, required this.name});

  @override
  State<PriceTile> createState() => _PriceTileState();
}

class _PriceTileState extends State<PriceTile> {
  StockQuote? quote;
  bool loading = true;

  @override
  void initState() {
    super.initState();
    _loadQuote();
  }

  Future<void> _loadQuote() async {
    try {
      final repo =
          RepositoryProvider.of<StockRepository>(context, listen: false);
      final q = await repo.getQuote(widget.symbol);
      if (!mounted) return;
      setState(() {
        quote = q;
        loading = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardBg,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          final repo =
              RepositoryProvider.of<StockRepository>(context, listen: false);
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return BlocProvider(
              create: (_) => StockDetailBloc(repository: repo)
                ..add(LoadStockDetail(widget.symbol)),
              child: StockDetailPage(symbol: widget.symbol),
            );
          }));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Symbol + Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.symbol,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 4),
                  Text(widget.name,
                      style: const TextStyle(
                          color: AppColors.secondaryText, fontSize: 13)),
                ],
              ),
              // Price
              loading
                  ? const SizedBox(
                      width: 60,
                      height: 12,
                      child: LinearProgressIndicator(minHeight: 2),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                            quote != null
                                ? quote!.current.toStringAsFixed(2)
                                : '-',
                            style: const TextStyle(
                                fontFamily: 'RobotoMono',
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        const SizedBox(height: 4),
                        Text(
                          quote != null
                              ? ((quote!.current - quote!.prevClose) >= 0
                                  ? '+${(quote!.current - quote!.prevClose).toStringAsFixed(2)}'
                                  : (quote!.current - quote!.prevClose)
                                      .toStringAsFixed(2))
                              : '',
                          style: TextStyle(
                              color: quote != null
                                  ? (quote!.current - quote!.prevClose >= 0
                                      ? AppColors.priceUp
                                      : AppColors.priceDown)
                                  : AppColors.secondaryText,
                              fontSize: 12,
                              fontFamily: 'RobotoMono'),
                        )
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}
