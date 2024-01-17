import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../home/alumni_connect/model/ChatMessage.dart';
class SqliteService {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, 'database.db'),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE chats(id INTEGER PRIMARY KEY AUTOINCREMENT,sender TEXT NOT NULL,receiver TEXT NOT NULL,messageContent TEXT NOT NULL,messageType TEXT NOT NULL,timeChat TEXT NOT NULL)",
        );
      },
      version: 1,
    );
  }

  Future<int> addNew(ChatMessage note) async {
    final Database db = await initializeDB();
    final id = await db.insert(
        'chats', note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    print("------------------------${id}---------------------");
    return id;
  }

  Future<List<ChatMessage>> getItems(String currentUser,String otherUser) async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('chats', where: " ((sender=${currentUser} or receiver=${currentUser}) and (sender=${otherUser} or receiver=${otherUser}))",orderBy: "id desc");
    return queryResult.map((e) => ChatMessage.fromMap(e)).toList();
  }
}