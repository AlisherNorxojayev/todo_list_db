import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_list_db/main.dart';
import 'package:todo_list_db/screens/sign_up.dart';
import 'package:todo_list_db/services/todoAPI.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("images/1.png"))),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            const Text(
              "Welcome\n   Back",
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
              width: MediaQuery.of(context).size.height * 0.3,
              child: TextField(
                controller: _controller1,
                style: TextStyle(),
                decoration: InputDecoration(
                    focusColor: Colors.blue,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    hintText: "username",
                    prefixIcon: Icon(Icons.person),
                    prefixIconColor: Colors.purple),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.height * 0.3,
              child: TextField(
                controller: _controller2,
                style: TextStyle(),
                obscureText: true,
                decoration: InputDecoration(
                    focusColor: Colors.blue,
                    counterText: "",
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    hintText: "password",
                    prefixIcon: Icon(Icons.key),
                    prefixIconColor: Colors.purple),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            TextButton(
              onPressed: () {
                addTodo("12","13");
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
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue),
                child: Padding(
                  padding: const EdgeInsets.all(9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Log in",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        height: 50,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text("New User?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                      child: const Text("Sign Up"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
