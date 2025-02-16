import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/discount_model.dart';
import '../../network_interface/repositories/history_repository.dart';

part 'history_event.dart';

part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({
    required HistoryRepository historyRepository,
  })  : _historyRepository = historyRepository,
        super(const HistoryInitial(discounts: [])) {
    on<GetHistory>((event, emit) async {
      try {
        if (event.reset) {
          discounts = [];
        }
        emit(HistoryLoading(discounts: discounts));
        await _historyRepository.initializeDatabase();
        final newDiscounts = await _historyRepository.getHistories()
          ..reversed;
        discounts.addAll(newDiscounts);
        emit(HistoryLoaded(discounts: discounts));
      } on Exception catch (e) {
        debugPrint('Error: $e');
        emit(HistoryError(error: e.toString(), discounts: discounts));
      }
    });

    on<AddHistory>((event, emit) async {
      try {
        emit(HistoryLoading(discounts: discounts));
        discounts.insert(0, event.discountModel);
        await _historyRepository.addHistory(event.discountModel);
        emit(HistoryLoaded(discounts: discounts));
      } on Exception catch (e) {
        emit(HistoryError(error: e.toString(), discounts: discounts));
      }
    });

    on<DeleteHistory>((event, emit) async {
      try {
        emit(HistoryLoading(discounts: discounts));
        discounts
            .removeWhere((element) => element.id == event.discountModel.id);

        await _historyRepository.deleteHistory(event.discountModel);
        emit(HistoryLoaded(discounts: discounts));
      } on Exception catch (e) {
        emit(HistoryError(error: e.toString(), discounts: discounts));
      }
    });

    on<UpdateHistory>((event, emit) async {
      try {
        emit(HistoryLoading(discounts: discounts));
        final index = discounts
            .indexWhere((element) => element.id == event.discountModel.id);
        discounts[index] = event.discountModel;
        await _historyRepository.updateHistory(event.discountModel);
        emit(HistoryLoaded(discounts: discounts));
      } on Exception catch (e) {
        emit(HistoryError(error: e.toString(), discounts: discounts));
      }
    });
  }

  final HistoryRepository _historyRepository;
  List<DiscountModel> discounts = [];
}
