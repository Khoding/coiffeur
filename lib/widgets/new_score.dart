import 'package:flutter/material.dart';

class NewScore extends StatefulWidget {
  final Function addNewTransaction;

  NewScore(this.addNewTransaction) {
    print('Constructor NewTransaction Widget');
  }

  @override
  _NewScoreState createState() {
    print('createState NewTransaction Widget');
    return _NewScoreState();
  }
}

/// Pas utilisé pour le moment, mais servirat à ajouter des scores
class _NewScoreState extends State<NewScore> {
  _NewScoreState() {
    print('Constructor NewTransaction State');
  }

  final _amountController = TextEditingController();

  void submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredAmount = int.parse(_amountController.text);

    widget.addNewTransaction(
      enteredAmount,
    );
    Navigator.of(context).pop(enteredAmount);
  }

  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  @override
  void didUpdateWidget(NewScore oldWidget) {
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
                  labelText: 'Score',
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
