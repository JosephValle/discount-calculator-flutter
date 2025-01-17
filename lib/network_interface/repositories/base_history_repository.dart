import "package:discount_calculator/models/discount_model.dart";

abstract class BaseHistoryRepository {
  Future<List<DiscountModel>> getHistories(page);

  Future<void> addHistory(DiscountModel discount);

  Future<void> deleteHistory(DiscountModel discount);

  Future<void> updateHistory(DiscountModel discount);
}
