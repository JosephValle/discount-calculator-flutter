import "package:discount_calculator/models/discount_model.dart";
import "package:discount_calculator/network_interface/api_clients/database_api_client.dart";

import "base_history_repository.dart";

class HistoryRepository implements BaseHistoryRepository {
  final DatabaseApiClient _databaseApiClient = DatabaseApiClient();

  @override
  Future<void> addHistory(DiscountModel discount) async {
    await _databaseApiClient.add(discount);
  }

  @override
  Future<void> deleteHistory(DiscountModel discount) async {
    await _databaseApiClient.remove(discount);
  }

  @override
  Future<List<DiscountModel>> getHistories(page) {
    return _databaseApiClient.getAll();
  }

  @override
  Future<void> updateHistory(DiscountModel discount) {
    return _databaseApiClient.update(discount);
  }
}
