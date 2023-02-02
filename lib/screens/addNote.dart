import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_db/main.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  @override
  String date() {
    String date = "";
    String day = DateTime.now().day.toString();
    String month = DateTime.now().month.toString();
    String hour = DateTime.now().hour.toString();
    String minute = DateTime.now().minute.toString();
    if (month == "1") {
      date += "January" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "2") {
      date += "February" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "3") {
      date += "March" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "4") {
      date += "April" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "5") {
      date += "May" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "6") {
      date += "June" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "7") {
      date += "July" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "8") {
      date += "August" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "9") {
      date += "September" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "10") {
      date += "October" + " " + day + "," + " " + hour + ":" + minute;
    } else if (month == "11") {
      date += "November" + " " + day + "," + " " + hour + ":" + minute;
    } else {
      date += "December" + " " + day + "," + " " + hour + ":" + minute;
    }
    date = " " + date;
    return date;
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 50,
                      ),
                      const Text(
                        "New Task",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MyApp(
                                    plan: "",
                                    date: "",
                                    x: false,
                                    x2: true,
                                  ),
                                ));
                          },
                          icon: const Icon(Icons.crop_square))
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: const [
                      Text(
                        "What are you planning?",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: _controller,
                    cursorHeight: 40,
                    maxLines: 5,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.date_range,
                        color: Color.fromARGB(255, 135, 130, 130),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(date()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.note_alt,
                        color: Color.fromARGB(255, 135, 130, 130),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Add Note"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.category,
                        color: Color.fromARGB(255, 135, 130, 130),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Category"),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              child: TextButton(
                onPressed: () {
                  if (_controller.text != "") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(
                              plan: _controller.text,
                              date: date(),
                              x: true,
                              x2: true),
                        ));
                  }
                },
                child: const Text(
                  "Create",
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
