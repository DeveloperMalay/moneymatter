import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymatter/feature/a_home/data/model/money_data_model.dart';
import 'package:moneymatter/feature/a_home/presentation/cubit/cubit/moneydata_cubit.dart';

class DataEnterPage extends StatefulWidget {
  const DataEnterPage({super.key});

  @override
  State<DataEnterPage> createState() => _DataEnterPageState();
}

class _DataEnterPageState extends State<DataEnterPage> {
  late TextEditingController nameController;
  late TextEditingController amountController;
  late TextEditingController deadlineController;
  @override
  void initState() {
    nameController = TextEditingController();
    amountController = TextEditingController();
    deadlineController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    deadlineController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Name'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: amountController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Amount'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: deadlineController,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(),
                  hintText: 'Enter Deadline'),
            ),
            const Spacer(),
            CupertinoButton(
                color: Theme.of(context).colorScheme.inversePrimary,
                child: const Text('Save'),
                onPressed: () {
                  Navigator.pop(context);
                  context.read<MoneydataCubit>().addData(MoneyDataModel(
                      nameController.text,
                      double.parse(amountController.text),
                      deadlineController.text));
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
