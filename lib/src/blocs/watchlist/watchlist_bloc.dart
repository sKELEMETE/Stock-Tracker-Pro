import 'package:bloc/bloc.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';
import '../../repositories/stock_repository.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  final StockRepository repository;

  WatchlistBloc({required this.repository}) : super(WatchlistLoading()) {
    on<LoadWatchlist>(_onLoad);
    on<AddWatchlistItem>(_onAdd);
    on<RemoveWatchlistItem>(_onRemove);
  }

  void _onLoad(LoadWatchlist event, Emitter<WatchlistState> emit) {
    final items = repository.getWatchlist();
    emit(WatchlistLoaded(items));
  }

  Future<void> _onAdd(
      AddWatchlistItem event, Emitter<WatchlistState> emit) async {
    await repository.addToWatchlist(event.item);
    add(LoadWatchlist());
  }

  Future<void> _onRemove(
      RemoveWatchlistItem event, Emitter<WatchlistState> emit) async {
    await repository.removeFromWatchlist(event.index);
    add(LoadWatchlist());
  }
}
