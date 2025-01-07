import 'package:flutter/material.dart';

import '../../../../core/utils/local_notification.dart';

class TodoPage extends StatefulWidget {
  static const routeName = '/todo';
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final NotificationService _notificationService = NotificationService();
  final List<String> _tasks = [];

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
      _notificationService.showNotification(
        'Task Added',
        'You have added a new task: $task',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter a new task',
                    ),
                    onSubmitted: _addTask,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // You can use a dialog or other UI to get the task input
                    _addTask('New Task'); // Placeholder for task input
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
