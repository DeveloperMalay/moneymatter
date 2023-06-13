import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moneymatter/feature/a_home/presentation/cubit/cubit/moneydata_cubit.dart';

import '../../../b_data_enter/presentation/pages/data_enter_page.dart';
import '../../local/notification/notification.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> selectedindex = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 40,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Money Record",
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        actions: [
          selectedindex.isNotEmpty
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      selectedindex.clear();
                    });
                  },
                  icon: const Icon(Icons.delete_outline_outlined))
              : IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: const Icon(Icons.refresh_outlined, color: Colors.black))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 38,
              child: TextFormField(
                style: const TextStyle(height: 1.0),
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 0)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          // FutureBuilder(
          //     future: getmoneydata(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return ListView.builder(itemBuilder: (context, index) {
          //           return Container(
          //             margin: const EdgeInsets.symmetric(
          //                 horizontal: 20, vertical: 10),
          //             padding: const EdgeInsets.all(10),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(10),
          //               color: Theme.of(context).colorScheme.inversePrimary,
          //             ),
          //             child: Row(
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: [
          //                 Column(
          //                   crossAxisAlignment: CrossAxisAlignment.start,
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     Text(snapshot.data![index].name),
          //                     Text('Deadline-${snapshot.data![index].deadline}')
          //                   ],
          //                 ),
          //                 Text(snapshot.data![index].amount.toString())
          //               ],
          //             ),
          //           );
          //         });
          //       } else if (snapshot.hasError) {
          //         return Text('${snapshot.error}');
          //       }

          //       return const CircularProgressIndicator();
          //     }),
          ListView.builder(
              shrinkWrap: true,
              itemCount: context.read<MoneydataCubit>().state.moneydata.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // setState(() {
                    //   selectedindex.remove(index);
                    // });
                    DateTime reminderDateTime = DateTime(2023, 6, 9, 6,
                        17); // Set the desired reminder date and time
                    scheduleNotification(reminderDateTime);
                  },
                  onLongPress: () {
                    setState(() {
                      selectedindex.add(index);
                    });
                  },
                  // child: Container(
                  //   // color: const Color.fromARGB(255, 50, 50, 50),
                  //   margin: const EdgeInsets.symmetric(vertical: 10),
                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                  //   child: Row(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         margin: const EdgeInsets.only(top: 5),
                  //         padding: const EdgeInsets.all(5),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(100),
                  //             color: Colors.grey),
                  //         child: const Icon(
                  //           Icons.person_2_rounded,
                  //           color: Color.fromARGB(255, 228, 228, 228),
                  //         ),
                  //       ),
                  //       const SizedBox(width: 10),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //               context
                  //                   .watch<MoneydataCubit>()
                  //                   .state
                  //                   .moneydata[index]
                  //                   .name,
                  //               style: const TextStyle(
                  //                   fontSize: 15,
                  //                   fontWeight: FontWeight.w500,
                  //                   color: Color.fromARGB(255, 8, 8, 8))),
                  //           const SizedBox(height: 2),
                  //           Text(
                  //               'Deadline-${context.watch<MoneydataCubit>().state.moneydata[index].deadline}',
                  //               style: const TextStyle(
                  //                   fontSize: 12,
                  //                   fontWeight: FontWeight.w500,
                  //                   color: Colors.grey))
                  //         ],
                  //       ),
                  //       const Spacer(),
                  //       Text(
                  //           "Rs. ${context.watch<MoneydataCubit>().state.moneydata[index].amount.toString()}",
                  //           style: const TextStyle(
                  //               fontSize: 15,
                  //               fontWeight: FontWeight.w500,
                  //               color: Colors.red))
                  //     ],
                  //   ),
                  // ),
                  child: Container(
                    color: selectedindex.contains(index)
                        ? Theme.of(context)
                            .colorScheme
                            .inversePrimary
                            .withOpacity(.4)
                        : Colors.transparent,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  context
                                      .watch<MoneydataCubit>()
                                      .state
                                      .moneydata[index]
                                      .name,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.deepPurple)),
                              Text(
                                  "Rs. ${context.watch<MoneydataCubit>().state.moneydata[index].amount.toString()}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 69, 69, 69)))
                            ],
                          ),
                          selectedindex.contains(index)
                              ? IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ))
                              : Text(
                                  'Deadline:${context.watch<MoneydataCubit>().state.moneydata[index].deadline}',
                                  style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black))
                        ],
                      ),
                    ),
                  ),
                  // child: Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10),
                  //   child: Card(
                  //     elevation: 2,
                  //     child: ListTile(
                  //       title: Text(context
                  //           .watch<MoneydataCubit>()
                  //           .state
                  //           .moneydata[index]
                  //           .name),
                  //       subtitle: Text(
                  //           'Amount: \$${context.watch<MoneydataCubit>().state.moneydata[index].amount}'),
                  //       trailing: Text(
                  //           'Deadline: ${context.watch<MoneydataCubit>().state.moneydata[index].deadline}'),
                  //     ),
                  //   ),
                  // ),
                );
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const DataEnterPage();
          }));
        },
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }
}
