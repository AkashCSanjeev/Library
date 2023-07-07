import 'package:flutter/material.dart';
import 'package:library_management/global_variable.dart';
import 'package:provider/provider.dart';
import '../provider/user_provider.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userProvider>(context, listen: false).user;

    if (user.history!.isEmpty) {
      return const Scaffold(
        body: SafeArea(
          child: Center(child: Text("No books taken yet")),
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: GlobalVariable.dark,
          padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
          child: ListView.separated(
              itemBuilder: (context, index) {
                return Container(
                  color: user.history![index].status! == "returned"
                      ? GlobalVariable.grey
                      : user.history![index].isDue! == "false"
                          ? GlobalVariable.green
                          : GlobalVariable.red,
                  child: ExpansionTile(
                    textColor: Colors.black,
                    title: Text(
                      user.history![index].title!,
                      style: const TextStyle(fontWeight: FontWeight.w900),
                    ),
                    subtitle: Text(user.history![index].author!),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.navigate_next),
                    ),
                    children: [
                      Container(
                          width: double.maxFinite,
                          margin: const EdgeInsets.all(20),
                          child: SingleChildScrollView(
                            child: ListTile(
                              title: Text(user.history![index].description!),
                            ),
                          )),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: user.history!.length),
        ),
      ),
    );
  }
}
