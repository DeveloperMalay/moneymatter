import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymatter/feature/a_home/presentation/cubit/cubit/moneydata_cubit.dart';

import '../../../b_data_enter/presentation/pages/data_enter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Money Record'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          ListView.builder(
              shrinkWrap: true,
              itemCount: context.read<MoneydataCubit>().state.moneydata.length,
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(context
                              .watch<MoneydataCubit>()
                              .state
                              .moneydata[index]
                              .name),
                          Text(
                              'Deadline-${context.watch<MoneydataCubit>().state.moneydata[index].deadline}')
                        ],
                      ),
                      Text(context
                          .watch<MoneydataCubit>()
                          .state
                          .moneydata[index]
                          .amount
                          .toString())
                    ],
                  ),
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const DataEnterPage();
          }));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
