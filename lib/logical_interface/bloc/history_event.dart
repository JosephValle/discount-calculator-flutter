part of "history_bloc.dart";

@immutable
sealed class HistoryEvent {}

class GetHistory extends HistoryEvent {
  final bool reset;

  GetHistory({
    this.reset = false,
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
