import "package:bloc/bloc.dart";
import "package:discount_calculator/models/discount_model.dart";
import "package:meta/meta.dart";

import "../../network_interface/repositories/history_repository.dart";

part "history_event.dart";

part "history_state.dart";

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryRepository _historyRepository;
  bool hasMore = true;
  int page = 0;
  List<DiscountModel> discounts = [];

  HistoryBloc({
    required HistoryRepository historyRepository,
  })  : _historyRepository = historyRepository,
        super(const HistoryInitial(discounts: [])) {
    on<GetHistory>((event, emit) async {
      // TODO: implement event handler
    });

    on<AddHistory>((event, emit) async {
      // TODO: implement event handler
    });

    on<DeleteHistory>((event, emit) async {
      // TODO: implement event handler
    });

    on<UpdateHistory>((event, emit) async {
      // TODO: implement event handler
    });
  }
}
