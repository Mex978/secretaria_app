import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool multiLine;
  final String initialText;
  final ValueChanged<String> onChanged;

  const CustomTextField(
      {Key key,
      this.multiLine: false,
      this.labelText,
      this.hintText,
      this.onChanged,
      this.initialText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _textEditingController =
        TextEditingController(text: initialText);

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            labelText,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: TextField(
              maxLines: multiLine ? null : 1,
              controller: _textEditingController,
              onChanged: (value) => onChanged(value),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4)),
                  hintText: hintText),
            ),
          )
        ],
      ),
    );
  }
}
