// import 'package:moneymatter/feature/a_home/data/model/money_data_model.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// Future<void> insertMoney(MoneyDataModel money) async {
//   // Get a reference to the database.
//   final db = await openDatabase(
//     join(await getDatabasesPath(), 'money.db'),
//     onCreate: (db, version) {
//       return db.execute(
//         'CREATE TABLE money(name TEXT, amount INTEGER,deadline TEXT)',
//       );
//     },
//     version: 1,
//   );

//   // Insert the Dog into the correct table. You might also specify the
//   // `conflictAlgorithm` to use in case the same dog is inserted twice.
//   //
//   // In this case, replace any previous data.
//   await db.insert(
//     'money',
//     money.toMap(),
//     conflictAlgorithm: ConflictAlgorithm.replace,
//   );
// }
