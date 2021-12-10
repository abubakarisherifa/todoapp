import 'dart:async';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todoapp/Home_view/create_todo.dart';
import 'package:todoapp/Home_view/utils.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:todoapp/Share_Todo_tile/todo_tile_widget.dart';
import 'package:todoapp/Home_view/create_todo.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<Map<String, dynamic>> completed = [];
  List<Map<String, dynamic>> uncompleted = [];
  List<Map<String, dynamic>> data = [
    {
      "title": "trip to space",
      "description": "this trip will last a week",
      "date_time": "tomorrow",
      "status": false,
    },
    {
      "title": "trip to Dubai",
      "description":
          "this trip will last a month and i intend goig with you guys and my mum",
      "date_time": "24/12/2021",
      "status": false,
    },
    {
      "title": "buy a car",
      "description":
          "after trip i intend to buy 2022 latest model S car in tesla company",
      "date_time": "24/12/2021",
      "status": false,
    },
    {
      "title": "lunch kenkey",
      "description":
          "I want to take kenkey as lunch today at 12:30pm in ivally Ghana",
      "date_time": "today",
      "status": true,
    },
  ];
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (element['status']) {
        completed.add(element);
      } else {
        uncompleted.add(element);
      }
    }
    Timer(const Duration(seconds: 2), () => callback());
    super.initState();
  }

  String isloaded = 'todo';
  int count = 0;

  void callback() {
    setState(() {
      count = count + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: custColor(date: 'appbarColor'),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              return const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_img.jpg'),
                radius: 25,
                backgroundColor: Colors.amber,
              );
            }),
          ),
          title: const Text('My Task'),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.menu),
            ),
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            )
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return count == 0
                  ? SkeletonAnimation(
                      shimmerColor: Colors.grey,
                      borderRadius: BorderRadius.circular(20),
                      shimmerDuration: 1000,
                      child: Todo_tile_wedge(
                          title: '',
                          description: '',
                          dateTime: '',
                          status: false),
                    )
                  : Todo_tile_wedge(
                      title: isloaded == 'Todo'
                          ? uncompleted[index]['title']
                          : completed[index]['title'],
                      description: isloaded == 'Todo'
                          ? uncompleted[index]['description']
                          : completed[index]['description'],
                      dateTime: isloaded == 'Todo'
                          ? uncompleted[index]['date_time']
                          : completed[index]['date_time'],
                      status: isloaded == 'Todo'
                          ? uncompleted[index]['status']
                          : completed[index]['status']);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemCount: uncompleted.length),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CreateTodo();
            }));
          },
          child: const Icon(Icons.add),
          backgroundColor: custColor(date: 'appbarColor'),
        ),
        bottomNavigationBar: SafeArea(
          child: InkWell(
            onTap: () {
              showBarModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return Todo_tile_wedge(
                              title: completed[index]['title'],
                              description: completed[index]['description'],
                              dateTime: completed[index]['date_time'],
                              status: completed[index]['status']);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 5,
                          );
                        },
                        itemCount: uncompleted.length);
                  });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: custColor(date: 'appbarColor'),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(children: const [
                    Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      'complete',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '2',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ])),
            ),
          ),
        ));
  }
}
