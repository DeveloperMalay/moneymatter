import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymatter/feature/a_home/data/model/money_data_model.dart';
import 'package:moneymatter/feature/a_home/presentation/cubit/cubit/moneydata_cubit.dart';

class DataEnterPage extends StatefulWidget {
  const DataEnterPage({super.key});

  @override
  State<DataEnterPage> createState() => _DataEnterPageState();
}

class _DataEnterPageState extends State<DataEnterPage> {
  final _formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Data'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
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
                inputFormatters: [
                  LengthLimitingTextInputFormatter(64),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: amountController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Amount'),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]')),
                  // LengthLimitingTextInputFormatter(10),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: deadlineController,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    border: OutlineInputBorder(),
                    hintText: 'Enter Deadline'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const Spacer(),
              CupertinoButton(
                  color: Colors.deepPurple,
                  child: const Text('Save'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      context.read<MoneydataCubit>().addData(MoneyDataModel(
                          id: 3,
                          name: nameController.text,
                          amount: double.parse(amountController.text),
                          deadline: deadlineController.text));
                    }

                    // await insertMoney(MoneyDataModel(
                    //     id: int.parse(DateTime.now().toString()),
                    //     name: nameController.text,
                    //     amount: double.parse(amountController.text),
                    //     deadline: deadlineController.text));
                  }),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
