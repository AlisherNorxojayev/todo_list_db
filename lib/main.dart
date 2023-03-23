import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_db/screens/addNotePage.dart';
import 'package:todo_list_db/screens/home_page.dart';
import 'package:todo_list_db/screens/login_page.dart';
import 'package:todo_list_db/screens/pageAll.dart';
import 'package:todo_list_db/services/todoAPI.dart';

complete({bool y = false}) async {
  final _sharedPreferences = await SharedPreferences.getInstance();
  bool x = _sharedPreferences.getBool("complete") ?? false;
  x = y;
  return x;
}

void main() {
  // if (complete()) {
  //   runApp(MaterialApp(
  //     home: MyApp(
  //       date: "",
  //       plan: "",
  //       x: false,
  //     ),
  //     debugShowCheckedModeBanner: false,
  //   ));
  // } else {
  //   runApp(MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     home: LoginPage(),
  //   ));
  // }
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  final String plan;
  final String date;
  final bool x;
  const MyApp({
    Key? key,
    required this.date,
    required this.plan,
    required this.x,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List list_data = [];

  void getdata() async {
    final _sharedPreferences = await SharedPreferences.getInstance();
    // _sharedPreferences.setString("data", jsonEncode(list_data));
    if (!widget.x) {
      list_data = jsonDecode(_sharedPreferences.getString("data")!);
      _sharedPreferences.setString("data", jsonEncode(list_data));
    } else {
      list_data = jsonDecode(_sharedPreferences.getString("data")!);
      list_data.add({"title": widget.plan, "describtion": widget.date});
      _sharedPreferences.setString("data", jsonEncode(list_data));
    }
  }

  Widget rectangleConTainer(Icon _icon, String str) {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              blurStyle: BlurStyle.inner,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3))),
      child: TextButton(
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PageAll(list_data: list_data.reversed.toList()),
              ));
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 50, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(child: _icon),
              const SizedBox(
                height: 35,
              ),
              Text(
                str,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "Num Tasks",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getdata();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        drawer: Drawer(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    },
                    icon: Icon(Icons.exit_to_app))
              ],
            )),
        body: FutureBuilder(
         
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      "Lists",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisSpacing: 20,
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        children: [
                          rectangleConTainer(
                            const Icon(
                              Icons.all_inbox,
                              color: Colors.blue,
                              size: 40,
                            ),
                            " All",
                          ),
                          rectangleConTainer(
                              const Icon(
                                Icons.work_outline,
                                color: Colors.orange,
                                size: 40,
                              ),
                              "Work")
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisSpacing: 20,
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        children: [
                          rectangleConTainer(
                            const Icon(
                              Icons.queue_music,
                              color: Colors.redAccent,
                              size: 40,
                            ),
                            "Musics",
                          ),
                          rectangleConTainer(
                              const Icon(
                                Icons.airplanemode_active,
                                color: Colors.green,
                                size: 40,
                              ),
                              "Travel")
                        ],
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisSpacing: 20,
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        children: [
                          rectangleConTainer(
                            const Icon(
                              Icons.menu_book,
                              color: Colors.purple,
                              size: 40,
                            ),
                            "Study",
                          ),
                          rectangleConTainer(
                              const Icon(
                                Icons.home_outlined,
                                color: Colors.orange,
                                size: 40,
                              ),
                              "Home")
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Text("hasError");
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // final Alisher = await SharedPreferences.getInstance();
            // final prefs = await SharedPreferences.getInstance();
            // await prefs.setInt('counter', int.parse(_controller.text));
            // final counter = prefs.getInt('counter');
            // Navigator.pushNamed(context, "AddNote");

            //   print(1);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNote(),
                ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
