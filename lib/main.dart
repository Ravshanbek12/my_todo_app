import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_todo_app/repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ToDoApp(),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  late Repository repository;

  @override
  void initState() {
    repository = Repository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int? factorial;
    bool isLoading=false;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          isLoading=true;
          factorial = Random().nextInt(30);
          print(factorial);
          isLoading=false;
          setState(() {

          });
          // await repository.createToDo("To DO", "To DO Desc");
        },
        child: const Icon(Icons.add),
      ),
      body: Builder(
        builder: (context) {
          if(isLoading){
            return const Center(child: CupertinoActivityIndicator(),);
          }
          else{
            if(factorial==null){
              return const Center(child: Text("Number of selected"),);
            }
            else{
              return Center(child: Text("Factorial number:$factorial,result:-"),);
            }
          }
          return Center(child: Text("120"),);
        }
      ),
      // body: StreamBuilder<List<ToDoModel>>(
      //     stream: repository.stream,
      //     builder: (context, snapshot) {
      //       if (snapshot.data == null) {
      //         return const Center(
      //           child: Text("No TODO",style: TextStyle(color: Colors.black),),
      //         );
      //       } else {
      //         final todos = snapshot.data!;
      //         return ListView.separated(
      //           itemCount: todos.length,
      //           itemBuilder: (_, index) {
      //             return ListTile(
      //               title: Text(
      //                 todos[index].title,
      //               ),
      //               subtitle: Text(todos[index].disc),
      //             );
      //           },
      //           separatorBuilder: (_,__) {
      //             return const SizedBox(
      //               height: 6,
      //             );
      //           },
      //         );
      //       }
      //     }),
    );
  }
}
