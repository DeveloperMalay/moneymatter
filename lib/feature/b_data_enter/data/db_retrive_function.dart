// import 'package:moneymatter/feature/a_home/data/model/money_data_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// Future<List<MoneyDataModel>> getmoneydata() async {
//   // Get a reference to the database.
//   final db = await openDatabase(
//     join(await getDatabasesPath(), 'money_database.db'),
//     onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE money(name TEXT, amount INTEGER,deadline TEXT)',
//       );
//     },
//     version: 1,
//   );

//   // Query the table for all The Dogs.
//   final List<Map<String, dynamic>> maps = await db.query('money_database');

//   // Convert the List<Map<String, dynamic> into a List<Dog>.
//   return List.generate(maps.length, (i) {
//     return MoneyDataModel(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         amount: maps[i]['amount'],
//         deadline: maps[i]['deadline']);
//   });
// }
