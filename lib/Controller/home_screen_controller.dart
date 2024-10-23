import 'package:sqflite/sqflite.dart';

class HomeScreenController {
  static late Database contactDatabase;
  static List<Map> contactsList = [];

  static Future initDb() async {
    // open the database
    contactDatabase = await openDatabase("contactData.db", version: 2,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE contacts (id INTEGER PRIMARY KEY, name TEXT, phone TEXT, imagepath TEXT)');
      await db.execute(
          'CREATE TABLE calllogs (id INTEGER PRIMARY KEY, dateandtime TEXT)');
    });
  }

  static Future addContact(String name, String phone, String? imagepath) async {
    await contactDatabase.rawInsert(
      'INSERT INTO contacts (name, phone, imagepath) VALUES(?, ?, ?)',
      [name, phone, imagepath],
    );
  }

  static Future getAllContacts() async {
    contactsList = await contactDatabase.rawQuery('SELECT * FROM contacts');
    print(contactsList);
  }

  static Future removeContact(int id) async {
    await contactDatabase.rawDelete('DELETE FROM contacts WHERE id =?', [id]);
    getAllContacts();
  }

  static Future<List<String>> listTables() async {
    List<Map<String, dynamic>> tables = await contactDatabase
        .rawQuery("SELECT name FROM sqlite_master WHERE type='table'");

    // Extract table names from the result and return as a list of strings
    List<String> tableNames =
        tables.map((table) => table['name'] as String).toList();

    print(tableNames); // You can print this to verify the list of tables
    return tableNames;
  }
}
