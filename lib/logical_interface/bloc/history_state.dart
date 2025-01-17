part of "history_bloc.dart";

@immutable
sealed class HistoryState {
  final List<DiscountModel> discounts;

  const HistoryState({
    required this.discounts,
  });
}

final class HistoryInitial extends HistoryState {
  const HistoryInitial({required super.discounts});
}

final class HistoryLoading extends HistoryState {
  const HistoryLoading({required super.discounts});
}

final class HistoryLoaded extends HistoryState {
  const HistoryLoaded({required super.discounts});
}

final class HistoryError extends HistoryState {
  final String error;

  const HistoryError({required this.error, required super.discounts});
}
