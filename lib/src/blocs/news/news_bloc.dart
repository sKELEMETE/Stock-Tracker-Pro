import 'package:bloc/bloc.dart';
import 'news_event.dart';
import 'news_state.dart';
import '../../repositories/stock_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final StockRepository repository;
  NewsBloc({required this.repository}) : super(NewsLoading()) {
    on<LoadMarketNews>(_onLoad);
  }

  Future<void> _onLoad(LoadMarketNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      // Simple approach: fetch news for a common symbol list. Expand later.
      final symbols = ['AAPL', 'MSFT', 'GOOGL', 'TSLA'];
      final all = <dynamic>[];
      for (final s in symbols) {
        final n = await repository.getNews(s);
        all.addAll(n);
      }
      // cast safe
      final articles = List<dynamic>.from(all).cast();
      emit(NewsLoaded(List.from(articles)));
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}
