import 'package:flutter/material.dart';
import 'package:todo_list_db/main.dart';

class PageAll extends StatefulWidget {
  final List list_data;
  const PageAll({super.key, required this.list_data});

  @override
  State<PageAll> createState() => _PageAllState();
}

class _PageAllState extends State<PageAll> {
  @override
  List _list = [];
  void filter_list_data() {
    for (int i = 0; i < widget.list_data.length; i++) {
      // print(widget.list_data[i]["describtion"]);
      if (widget.list_data[i]["describtion"] != "") {
        _list.add(widget.list_data[i]);
      }
    }
  }

  Widget build(BuildContext context) {
    filter_list_data();
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(
                      date: "",
                      plan: "",
                      x: false,
                    ),
                  ));
            },
            icon: Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 40),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.book_outlined,
                              color: Colors.blue,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text("All",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        print("tap");
                      },
                      title: Text(_list[index]["title"]),
                      subtitle: Text(_list[index]["describtion"]),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
