import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:path/path.dart';

Future<Database> initWifiDatabase() async {
  applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
  databaseFactory = databaseFactoryFfi;
  final dir = await getApplicationDocumentsDirectory();
  if (!await dir.exists()) {
    await dir.create(recursive: true);
  }
  // final db = sqlite3.open(p.join(dir.path, 'my_database.db'));
  final database = openDatabase(
    join(dir.path, 'accounts.db'),
    version: 1,
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE ipTable(id INTEGER PRIMARY KEY, iaddress TEXT, imac TEXT,create_time TEXT)',
      );
    },
  );
  // SqliteEngine().database = await database;
  return database;
}

insertWifiAdress(Database database, String wifi) async {
  var now = DateTime.now().toIso8601String();

  var existing =
      await database.query("ipTable", where: "iaddress = ?", whereArgs: [wifi]);
  if (existing.isEmpty) {
    await database
        .insert("ipTable", {'iaddress': wifi, 'imac': "", 'create_time': now});
  }
}

Future<List> queryWifis(Database database) async {
  final List<Map<String, dynamic>> maps = await database.query('ipTable');
  return maps;
}

deleteWifi(Database database, String wifi) {
  database.delete("ipTbale", where: "iaddress =  ?", whereArgs: [wifi]);
}
