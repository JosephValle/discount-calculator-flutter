import "package:sqflite/sqflite.dart";
import "../../models/discount_model.dart";

class DatabaseApiClient {
  late Database _db;

  Future<void> initializeDatabase() async {
    _db = await openDatabase(
      "discounts.db",
      version: 1,
      onCreate: (db, version) async {
        await db.execute("""
          CREATE TABLE discounts (
            id TEXT PRIMARY KEY,
            priceBeforeDiscount REAL,
            discountedPrice REAL,
            date TEXT,
            description TEXT
          )
        """);
      },
    );
  }

  // getAll
  Future<List<DiscountModel>> getAll() async {
    final List<Map<String, dynamic>> maps = await _db.query("discounts");
    return maps.map((map) => DiscountModel.fromMap(map)).toList();
  }

  // add
  Future<void> add(DiscountModel discountModel) async {
    await _db.insert(
      "discounts",
      discountModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // update
  Future<void> update(DiscountModel discountModel) async {
    await _db.update(
      "discounts",
      discountModel.toMap(),
      where: "id = ?",
      whereArgs: [discountModel.id],
    );
  }

  // remove
  Future<void> remove(DiscountModel discountModel) async {
    await _db.delete(
      "discounts",
      where: "id = ?",
      whereArgs: [discountModel.id],
    );
  }
}
