import 'package:flutter/material.dart';

class ToDoHome extends StatefulWidget {
  const ToDoHome({super.key});

  @override
  _ToDoHomeState createState() => _ToDoHomeState();
}

class _ToDoHomeState extends State<ToDoHome> {
  final List<String> _tasks = []; // Lista de tarefas
  final TextEditingController _taskController =
      TextEditingController(); // Controlador para entrada de texto

  void _addTask(String task) {
    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(task); // Adiciona a tarefa à lista
      });
      _taskController.clear(); // Limpa o campo de texto
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index); // Remove a tarefa da lista pelo índice
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tarefas'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      labelText: 'Nova Tarefa',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => _addTask(_taskController.text),
                  child: Text('Adicionar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _removeTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
