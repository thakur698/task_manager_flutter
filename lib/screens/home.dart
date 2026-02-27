import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample/provider/taskprovider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<Taskprovider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Task Manager',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: provider.isloading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      FilterChip(
                        label: const Text("Completed"),
                        selected: provider.filter == "Completed",
                        onSelected: (_) =>
                            context.read<Taskprovider>().setFilter("Completed"),
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: const Text("Pending"),
                        selected: provider.filter == "Pending",
                        onSelected: (_) =>
                            context.read<Taskprovider>().setFilter("Pending"),
                      ),
                      const SizedBox(width: 8),
                      FilterChip(
                        label: const Text("All"),
                        selected: provider.filter == "All",
                        onSelected: (_) =>
                            context.read<Taskprovider>().setFilter("All"),
                      ),
                    ],
                  ),
                ),

                /// EMPTY STATE
                Expanded(
                  child: provider.tasks.isEmpty
                      ? const Center(
                          child: Text(
                            "No tasks found",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      : ListView.builder(
                          itemCount: provider.tasks.length,
                          itemBuilder: (context, index) {
                            final task = provider.tasks[index];

                            return ListTile(
                              title: Text(task.title),
                              subtitle: Text(
                                task.completed ? "Completed" : "Pending",
                                style: TextStyle(
                                  color: task.completed
                                      ? Colors.green
                                      : Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
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
