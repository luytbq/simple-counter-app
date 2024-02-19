// ignore_for_file: unused_field

import 'package:counter_app/domain/counter_item.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final List<CounterWidget> _counters = [];

  @override
  void initState() {
    super.initState();
    _addCounter();
    _addCounter();
    _addCounter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Counter App'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var counter in _counters) counter,
                const SizedBox(height: 16), // Add some spacing
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {
            _addCounter();
          },
          child: const Text('Add Counter'),
        ),
      ],
    );
  }

  void _addCounter() {
    final newId = _idOfNexCounter();
    setState(() {
      _counters.add(CounterWidget(
        counter:
            Counter(id: newId, title: 'Item ${_counters.length}', count: 0),
        onDelete: () {
          _removeCounter(newId);
        },
      ));
    });
  }

  int _idOfNexCounter() {
    var maxId = 0;
    _counters.map((e) => e.counter.id).forEach((id) {
      if (maxId < id) {
        maxId = id;
      }
    });

    return maxId + 1;
  }

  void _removeCounter(int id) {
    setState(() {
      _counters.removeWhere((element) => element.counter.id == id);
    });
  }
}
