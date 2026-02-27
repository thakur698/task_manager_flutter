import 'package:flutter/material.dart';
import 'package:sample/modal/taskmodal.dart';
import 'package:sample/services/api.dart';

class Taskprovider extends ChangeNotifier {
  final Taskservice _service = Taskservice();

  List<TaskModal> _allTasks = [];
  List<TaskModal> _filteredTasks = [];

  bool _isloading = false;
  String _filter = "All";

  List<TaskModal> get tasks => _filteredTasks;
  bool get isloading => _isloading;
  String get filter => _filter;

  Future<void> fetchtask() async {
    _isloading = true;
    notifyListeners();

    try {
      _allTasks = await _service.fetchtask();

      print("TOTAL TASKS FROM API: ${_allTasks.length}"); // ⭐ ADD THIS

      _applyFilter();
    } catch (e) {
      print("ERROR: $e");
    }

    _isloading = false;
    notifyListeners();
  }

  void setFilter(String value) {
    _filter = value;
    _applyFilter();
    notifyListeners();
  }

  void _applyFilter() {
    if (_filter == "Completed") {
      _filteredTasks = _allTasks
          .where((task) => task.completed == true)
          .toList();
    } else if (_filter == "Pending") {
      _filteredTasks = _allTasks
          .where((task) => task.completed == false)
          .toList();
    } else {
      _filteredTasks = List.from(_allTasks);
    }
  }
}
