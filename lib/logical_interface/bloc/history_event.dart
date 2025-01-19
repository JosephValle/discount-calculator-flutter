part of 'history_bloc.dart';

@immutable
sealed class HistoryEvent {}

class GetHistory extends HistoryEvent {
  GetHistory({
    this.reset = false,
  });
  final bool reset;
}

class AddHistory extends HistoryEvent {
  AddHistory({
    required this.discountModel,
  });
  final DiscountModel discountModel;
}

class DeleteHistory extends HistoryEvent {
  DeleteHistory({
    required this.discountModel,
  });
  final DiscountModel discountModel;
}

class UpdateHistory extends HistoryEvent {
  UpdateHistory({
    required this.discountModel,
  });
  final DiscountModel discountModel;
}
