import 'dart:io';
import 'dart:math';
// import 'pack';
import 'package:gcac_net_auth/bean/accounts/account.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


// import 'package:sq';
Future<void> main() async {
  // // 1. 定义HTML代码
  // var html =
  //     '''<html><head><script>location.replace("https://pt.gcac.edu.cn/portal.do?wlanuserip=...")</script></head></html>''';
  // var scriptRegex = RegExp('<script>(.*?)</script>');
  // var scriptMatch = scriptRegex.firstMatch(html);
  // var script = scriptMatch!.group(1);
  // if (script == null) print(false);
  // var loRegex = RegExp(r'location\.replace');
  // bool hasLocationReplace = loRegex.hasMatch(script.toString());
  // if (!hasLocationReplace) print(false);
  // var urlRegex = RegExp('"(.*?)"');
  // var urlMatch = urlRegex.firstMatch(script.toString());
  // if (urlMatch == null) print(false);
  // var url = urlMatch!.group(1);
  // Uri host = Uri.parse(url.toString());
  // var params = host.queryParameters;

  Future<Database> initDatabase() async {
    if (Platform.isWindows || Platform.isLinux) {
      // Initialize FFI
      sqfliteFfiInit();
    }
    databaseFactory = databaseFactoryFfi;
    final database = openDatabase(
      join(await getDatabasesPath(), 'accounts.db'),
      version: 1,
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE accounts(id INTEGER PRIMARY KEY, account TEXT, password TEXT,create_time TEXT)',
        );
      },
    );
    return database;
  }

  void insertAccount(Database database, String account, String password) async {
    var now = DateTime.now().toIso8601String();
    // 插入数据
    await database.insert("accounts",
        {'account': account, 'password': password, 'create_time': now});
  }

  Future<List<Account>> queryAccount(Database database) async {
    final List<Map<String, dynamic>> maps = await database.query('accounts');
    return List.generate(maps.length, (i) {
      return Account(
          acccount: maps[i]["account"], password: maps[i]["password"]);
    });
  }

  Future<List<Map<String, dynamic>>> queryPassword(
      Database database, String account) {
    return database
        .query('accounts', where: 'account = ?', whereArgs: [account]);
  }

  Database database = await initDatabase();

  sleep(Duration(seconds: 2));

  insertAccount(database, "account", "password");

  List<Account> acs = await queryAccount(database);

  print(acs);
 
  final accounts = await queryPassword(database, "account");
  print(accounts[0]);
}
