import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_db/models/models.dart';
import 'package:todo_list_db/screens/addNote.dart';
import 'package:todo_list_db/screens/pageAll.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(
      date: "",
      plan: "",
      x: false,
      x2: true,
    ),
  ));
}

class MyApp extends StatefulWidget {
  final String plan;
  final String date;
  final bool x;
  final bool x2;
  const MyApp(
      {Key? key,
      required this.date,
      required this.plan,
      required this.x,
      required this.x2})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Tasks> AllTasks = [];

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
          // AllTasks = [];
          final _sharedPreferences = await SharedPreferences.getInstance();

          // int n = 0;
          // _sharedPreferences.setInt("lenght", n);
          // n += 1;
          // int length = _sharedPreferences.getInt("lenght")!;
          // for (int i = 0; i < length; i++) {
          //   _sharedPreferences.setString("plan$i", widget.plan);
          //   _sharedPreferences.setString("date$i", widget.date);

          //   AllTasks.add(Tasks(_sharedPreferences.getString("plan$i") ?? "",
          //       _sharedPreferences.getString("date$i") ?? ""));
          // }
          _sharedPreferences.setString("1", "hjvcg");
          String a = _sharedPreferences.getString("1") ?? "";
          int m = _sharedPreferences.getInt("1") ?? 0;
          // _sharedPreferences.setInt("1", 0);
          // AllTasks = [];
          if (widget.x && widget.x2) {
            _sharedPreferences.setInt("1", m + 1);
            _sharedPreferences.setString("plan${m - 1}", widget.plan);
            _sharedPreferences.setString("date${m - 1}", widget.date);
            for (int i = 0; i < m; i++) {
              print("f $i");
              AllTasks.add(
                Tasks(
                  _sharedPreferences.getString("plan$i")!,
                  _sharedPreferences.getString("date$i")!,
                ),
              );
            }
          } else if (widget.x2) {
            for (int i = 0; i < m - 1; i++) {
              AllTasks.add(
                Tasks(
                  _sharedPreferences.getString("plan$i")!,
                  _sharedPreferences.getString("date$i")!,
                ),
              );
            }
          }

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PageAll(Plans: AllTasks.reversed.toList()),
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
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 30,
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Lists",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              // final Alisher = await SharedPreferences.getInstance();
              // final prefs = await SharedPreferences.getInstance();
              // await prefs.setInt('counter', int.parse(_controller.text));
              // final counter = prefs.getInt('counter');
              // Navigator.pushNamed(context, "AddNote");

              print(1);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddNote(),
                  ));
            },
            child: const Icon(Icons.add),
          )),
    );
  }
}
