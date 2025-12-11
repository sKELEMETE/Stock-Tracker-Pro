import 'package:flutter/material.dart';
import '../../models/stock_quote.dart';
import '../../repositories/stock_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/stock_detail_page.dart';
import '../../blocs/stock_detail/stock_detail_bloc.dart';
import '../../blocs/stock_detail/stock_detail_event.dart';

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
      if (!mounted) return; // <- Check mounted
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
    return ListTile(
      title: Text(widget.symbol),
      subtitle: Text(widget.name),
      trailing: loading
          ? const SizedBox(
              width: 80,
              child: Center(
                child: SizedBox(
                  height: 12,
                  width: 12,
                  child: CircularProgressIndicator(strokeWidth: 2),
                ),
              ),
            )
          : Text(
              quote != null ? quote!.current.toStringAsFixed(2) : '-',
              style: const TextStyle(fontFamily: 'RobotoMono'),
            ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          final repo =
              RepositoryProvider.of<StockRepository>(context, listen: false);
          return BlocProvider(
            create: (_) => StockDetailBloc(repository: repo)
              ..add(LoadStockDetail(widget.symbol)),
            child: StockDetailPage(symbol: widget.symbol),
          );
        }));
      },
    );
  }
}
