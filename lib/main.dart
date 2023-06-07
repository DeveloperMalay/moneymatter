import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'feature/a_home/presentation/cubit/cubit/moneydata_cubit.dart';
import 'feature/a_home/presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // openDatabase(
  //   join(await getDatabasesPath(), 'money_database.db'),
  //   onCreate: (db, version) {
  //     return db.execute(
  //       'CREATE TABLE money(id INTEGER, name TEXT, amount INTEGER,deadline TEXT,)',
  //     );
  //   },
  //   version: 1,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MoneydataCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const HomePage(),
      ),
    );
  }
}
