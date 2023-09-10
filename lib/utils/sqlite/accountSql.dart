// // import 'package:path_provider/path_provider.dart';
// // import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

// void initDatabse()async{
//   final dir = await getApplicationDocumentsDirectory();
//   if (!await dir.exists()) {
//     await dir.create(recursive: true);
//   }
//   sqlite3_flutter_libs.
//   var db = sqlite3.open("mydatabase.db");
// }

import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import '../../bean/accounts/account.dart';

Future<Database> initDatabase() async {
  // if (Platform.isWindows || Platform.isLinux) {
  //   // Initialize FFI
  //   sqfliteFfiInit();
  // }
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
        'CREATE TABLE accounts(id INTEGER PRIMARY KEY, account TEXT, password TEXT,create_time TEXT)',
      );
    },
  );
  // SqliteEngine().database = await database;
  return database;
}

void insertAccount(Database database, String account, String password) async {
  var now = DateTime.now().toIso8601String();
  // 插入数据
  var existing = await database
      .query("accounts", where: "account = ?", whereArgs: [account]);
  if (existing.isEmpty) {
    // 账户不存在,执行插入
    await database.insert("accounts",
        {'account': account, 'password': password, 'create_time': now});
    // await database.insert("accounts",
    //     {'account': account, 'password': password, 'create_time': now});
  }
}

Future<List<Account>> queryAccount(Database database) async {
  final List<Map<String, dynamic>> maps = await database.query('accounts');
  return List.generate(maps.length, (i) {
    return Account(acccount: maps[i]["account"], password: maps[i]["password"]);
  });
}

Future<List<Map<String, dynamic>>> queryPassword(
    Database database, String account) {
  return database.query('accounts', where: 'account = ?', whereArgs: [account]);
}

deleteAccount(Database database, String account) {
  database.delete("accounts", where: "account = ?", whereArgs: [account]);
}


