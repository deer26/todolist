import 'package:flutter/material.dart';
import 'package:todo/models/task_data.dart';
import 'package:todo/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskVeri, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskVeri.tasks[index];
            return TaskTile(
              taskTitle: task.name,
              isChecked: task.isDone,
              checkboxCallback: (checkDurumu) {
                taskVeri.updateTask(task);
              },
              longPressCallback: () {
                taskVeri.deleteTask(task);
              },
            );
          },
          itemCount: taskVeri.taskCount,
        );
      },
    );
  }
}