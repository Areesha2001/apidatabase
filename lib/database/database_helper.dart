import 'package:path/path.dart' as P;
import 'package:sqflite/sqflite.dart';
import 'package:apidatabase/model/post_data.dart';

class DataBaseHelper {
  Database? _db;
  String documentTable = 'postTable';
  String id = 'id';
  String userid = 'userid';
  String title = 'title';
  String body = 'body';
  var checkdb;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = P.join(databasesPath, 'post.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $documentTable(
      $userid INTEGER PRIMARY KEY AUTOINCREMENT,
       $id TEXT,
       $title TEXT,
       $body TEXT
      )''');
    print('Table Created!!');
  }

  Future<int> add_Data(Post post) async {
    print('data in insertDocumentData db class is...$post');
    var dbClient = await db;
    var result = await dbClient!.insert(documentTable, post.toMap());

    print('insert result of file in db  is...$result');
    return result;
  }

  Future get_Data() async {
    var dbClient = await db;
    return await dbClient!.query(documentTable, orderBy: 'userid');
  }

  Future<bool> documentPresentCheck() async {
    var dbClient = await db;
    List<Map> result = await dbClient!.rawQuery('SELECT * FROM $documentTable');
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
