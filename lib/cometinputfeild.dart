import 'package:flutter/material.dart';

class CommentInputField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(int rating, String comment) onSend;

  const CommentInputField({
    Key? key,
    required this.controller,
    required this.onSend,
  }) : super(key: key);

  @override
  _CommentInputFieldState createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  int _selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            "Rate this app",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(5, (index) {
              return IconButton(
                icon: Icon(
                  index < _selectedRating ? Icons.star : Icons.star_border,
                  color: Colors.orange,
                  size: 28,
                ),
                onPressed: () {
                  setState(() {
                    _selectedRating = index + 1;
                  });
                },
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: 'Write a comment...',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  if (_selectedRating > 0 &&
                      widget.controller.text.isNotEmpty) {
                    widget.onSend(_selectedRating, widget.controller.text);
                    widget.controller.clear();
                    setState(() {
                      _selectedRating = 0;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.send, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}