import 'package:bloc/bloc.dart';
import 'stock_detail_event.dart';
import 'stock_detail_state.dart';
import '../../repositories/stock_repository.dart';

class StockDetailBloc extends Bloc<StockDetailEvent, StockDetailState> {
  final StockRepository repository;

  StockDetailBloc({required this.repository}) : super(StockDetailLoading()) {
    on<LoadStockDetail>(_onLoad);
  }

  Future<void> _onLoad(
      LoadStockDetail event, Emitter<StockDetailState> emit) async {
    emit(StockDetailLoading());
    try {
      final quote = await repository.getQuote(event.symbol);
      final news = await repository.getNews(event.symbol);
      emit(StockDetailLoaded(quote: quote, news: news));
    } catch (e) {
      emit(StockDetailError(e.toString()));
    }
  }
}
