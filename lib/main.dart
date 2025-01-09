import 'package:flutter/material.dart';
import 'package:todo_app/todo_home.dart';

void main() {
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove a faixa "debug" do app
      title: 'Lista de Tarefas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ToDoHome(),
    );
  }
}
