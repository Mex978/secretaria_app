import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/dados_mockados.dart';

class AddItemDialog extends StatefulWidget {
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  DateTime selectedDate = DateTime.now();
  int _category = 0;
  String title;
  String description;
  DateTime date;

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
          child: Container(
        decoration: _decoration(),
        padding: EdgeInsets.all(1),
        child: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: _theme.backgroundColor,
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  _headerDialog(),
                  SizedBox(
                    height: 16,
                  ),
                  _selectCategory(),
                  SizedBox(
                    height: 16,
                  ),
                  _category == 0
                      ? _addTodo()
                      : _category == 2 ? _addNote() : Container(),
                  SizedBox(
                    height: 32,
                  ),
                  _buttonSubmit(
                      _category == 0
                          ? "Salvar To-Do"
                          : _category == 1 ? "Salvar Evento" : "Salvar Nota",
                      onPressed: () {
                    if (_category == 0) {
                      Todo todoItem;
                      if (title != null && date != null)
                        todoItem = Todo(
                            tile: title,
                            inicio: selectedDate,
                            descricao: description ?? null);
                      if (todoItem != null) todos.add(todoItem);
                    }
                  }),
                ],
              )),
        ),
      )),
    );
  }

  _decoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: [Color(0xFFF12C43), Color(0xFFD75C29)],
          stops: [0.2, 0.8],
        ));
  }

  _headerDialog() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Adicionar Item",
          style: TextStyle(fontSize: 20),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ),
        )
      ],
    );
  }

  _selectCategory() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Categoria:",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.white30)),
              child: DropdownButton(
                underline: Container(),
                isExpanded: true,
                value: _category,
                onChanged: (value) {
                  setState(() {
                    _category = value;
                  });
                },
                items: [
                  DropdownMenuItem(
                    child: Text("To-Do"),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Text("Evento"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Nota"),
                    value: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _addTodo() {
    return Column(
      children: <Widget>[
        _fieldToFill("Título"),
        SizedBox(
          height: 16,
        ),
        _fieldToFill("Descrição"),
        SizedBox(
          height: 16,
        ),
        _selectDate(),
      ],
    );
  }

  _addNote() {
    return Column(
      children: <Widget>[
        _fieldToFill("Título"),
        SizedBox(
          height: 16,
        ),
        _fieldToFill("Descrição"),
      ],
    );
  }

  _selectDate() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Data de início:",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white30),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                      "${selectedDate.day < 10 ? "0" + selectedDate.day.toString() : selectedDate.day}/${selectedDate.month < 10 ? "0" + selectedDate.month.toString() : selectedDate.day}/${selectedDate.year}"),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    highlightColor: Colors.transparent,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      showDatePicker(
                              locale: Locale("pt", "BR"),
                              context: context,
                              initialDate: selectedDate,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2050))
                          .then((date) {
                        if (date != null)
                          setState(() {
                            selectedDate = date;
                          });
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50)),
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.edit,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  _buttonSubmit(String text, {Function onPressed}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: [Color(0xFFF12C43), Color(0xFFD75C29)],
                    stops: [0.2, 0.8],
                  )),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashFactory: InkRipple.splashFactory,
                  borderRadius: BorderRadius.circular(25),
                  onTap: onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }

  _fieldToFill(String field) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            field + ":",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 4,
          ),
          TextField(
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
                hintText: field == "Título"
                    ? "Digite o título"
                    : "Digite a descrição (Opcional)"),
          )
        ],
      ),
    );
  }
}
