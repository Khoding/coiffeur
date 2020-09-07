import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction) {
    print('Constructor NewTransaction Widget');
  }

  @override
  _NewTransactionState createState() {
    print('createState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  _NewTransactionState() {
    print('Constructor NewTransaction State');
  }

  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    widget.addNewTransaction(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose()');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Titre',
                ),
                controller: _titleController,
                onSubmitted: (_) => submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Montant',
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
              ),
              RaisedButton(
                child: Text(
                  'Add Transaction',
                ),
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
