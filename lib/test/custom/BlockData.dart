import 'package:flutter/material.dart';

class BlockData {
  String textFieldValue = '';
  bool checkboxValue = false;
}

class BlockWidget extends StatefulWidget {
  BlockWidget({required this.data, required this.onDelete});

  final BlockData data;
  final VoidCallback onDelete;

  @override
  State<BlockWidget> createState() => _BlockWidgetState();
}

class _BlockWidgetState extends State<BlockWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              autofocus: false,
              onChanged: (value) {
                widget.data.textFieldValue = value;
              },
              decoration: InputDecoration(labelText: 'TextField'),
            ),
            Checkbox(
              value: widget.data.checkboxValue,
              onChanged: (value) {
                setState(() {
                  widget.data.checkboxValue = value!;
                });
              },
            ),
            SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: widget.onDelete,
              child: Text('Delete Block'),
            ),
          ],
        ),
      ),
    );
  }
}
