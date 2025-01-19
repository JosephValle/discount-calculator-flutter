import '../../models/discount_model.dart';
import '../api_clients/database_api_client.dart';

import 'base_history_repository.dart';

class HistoryRepository implements BaseHistoryRepository {
  final DatabaseApiClient _databaseApiClient = DatabaseApiClient();

  @override
  Future<void> initializeDatabase() async {
    await _databaseApiClient.initializeDatabase();
  }

  @override
  Future<void> addHistory(DiscountModel discount) async {
    await _databaseApiClient.add(discount);
  }

  @override
  Future<void> deleteHistory(DiscountModel discount) async {
    await _databaseApiClient.remove(discount);
  }

  @override
  Future<List<DiscountModel>> getHistories() => _databaseApiClient.getAll();

  @override
  Future<void> updateHistory(DiscountModel discount) =>
      _databaseApiClient.update(discount);
}
