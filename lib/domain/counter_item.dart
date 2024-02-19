import 'package:flutter/material.dart';

class Counter {
  int id;
  String title = 'Item';
  int count = 0;

  Counter({required this.id, required this.title, required this.count});

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }
}

class CounterWidget extends StatefulWidget {
  final Counter counter;
  final VoidCallback onDelete;

  const CounterWidget({Key? key, required this.counter, required this.onDelete})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  final TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.counter.title;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  widget.counter.decrement();
                });
              },
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _showDialogEditItem(context);
                });
              },
              child: Text(
                widget.counter.title,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            Text(
              widget.counter.count.toString(),
              style: const TextStyle(fontSize: 48),
            ),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  widget.counter.increment();
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _showDialogEditItem(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: TextField(
            controller: _titleController,
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                _showDialogConfirmDelete(context);
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                _saveItem(context);
              },
              child: const Text('Save'),
            ),
            TextButton(
              onPressed: () {
                _cancelEdit(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showDialogConfirmDelete(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Item'),
          content: const Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                _deleteItem(context);
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
            TextButton(
              onPressed: () {
                _cancelEdit(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _cancelEdit(BuildContext context) {
    Navigator.of(context).pop();
    _titleController.text = widget.counter.title;
  }

  void _saveItem(BuildContext context) {
    setState(() {
      widget.counter.title = _titleController.text;
    });
    Navigator.of(context).pop();
  }

  void _deleteItem(BuildContext context) {
    Navigator.of(context).pop();
    widget.onDelete();
  }
}
