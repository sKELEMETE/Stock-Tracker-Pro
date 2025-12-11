import 'package:equatable/equatable.dart';
import '../../models/watchlist_item.dart';

abstract class WatchlistEvent extends Equatable {
  const WatchlistEvent();
  @override
  List<Object?> get props => [];
}

class LoadWatchlist extends WatchlistEvent {}

class AddWatchlistItem extends WatchlistEvent {
  final WatchlistItem item;
  const AddWatchlistItem(this.item);
  @override
  List<Object?> get props => [item];
}

class RemoveWatchlistItem extends WatchlistEvent {
  final int index;
  const RemoveWatchlistItem(this.index);
  @override
  List<Object?> get props => [index];
}
