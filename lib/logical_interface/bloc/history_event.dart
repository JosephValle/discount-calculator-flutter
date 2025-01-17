part of "history_bloc.dart";

@immutable
sealed class HistoryEvent {}

class GetHistory extends HistoryEvent {
  final int limit;
  final int offset;

  GetHistory({
    required this.limit,
    required this.offset,
  });
}

class AddHistory extends HistoryEvent {
  final DiscountModel discountModel;

  AddHistory({
    required this.discountModel,
  });
}

class DeleteHistory extends HistoryEvent {
  final DiscountModel discountModel;

  DeleteHistory({
    required this.discountModel,
  });
}

class UpdateHistory extends HistoryEvent {
  final DiscountModel discountModel;

  UpdateHistory({
    required this.discountModel,
  });
}
