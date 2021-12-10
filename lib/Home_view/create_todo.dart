import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);
  final controllerTitle = TextEditingController();
  final controllerdescription = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerTime = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create What You Want Todo'),
      ),
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title required';
                  }
                },
                controller: controllerTitle,
                maxLines: 2,
                decoration: const InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                    hintText: 'Please type your event detail',
                    hintStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Description require';
                  }
                },
                maxLines: 1,
                controller: controllerdescription,
                decoration: const InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: Colors.blue,
                    ),
                    hintText: 'Please type your event',
                    hintStyle: TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Time require';
                        }
                      },
                      controller: controllerDate,
                      maxLines: 1,
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.now()
                                    .add(const Duration(days: 365)))
                            .then((selectDate) {
                          final DateFormat _dateFormat =
                              DateFormat('dd/MM/yyyy');
                          controllerDate.text = _dateFormat.format(selectDate!);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Date',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          hintText: 'enter date',
                          hintStyle: TextStyle(color: Colors.black),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue))),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: controllerTime,
                      maxLines: 1,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay?.now())
                            .then((selectTime) {
                          controllerTime.text = selectTime!.format(context);
                        });
                      },
                      decoration: const InputDecoration(
                          labelText: 'Time',
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                          hintText: 'enter time',
                          hintStyle: TextStyle(color: Colors.black),
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.lightBlue))),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    print('successful');
                    print(controllerTitle.text);
                    print(controllerdescription.text);
                    print(controllerDate.text);
                    print(controllerTime.text);
                  }
                },
                child: const Text(
                  'create',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
