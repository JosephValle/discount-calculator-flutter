import "package:discount_calculator/models/discount_model.dart";

abstract class BaseHistoryRepository {
  Future<void> initializeDatabase();

  Future<List<DiscountModel>> getHistories();

  Future<void> addHistory(DiscountModel discount);

  Future<void> deleteHistory(DiscountModel discount);

  Future<void> updateHistory(DiscountModel discount);
}
