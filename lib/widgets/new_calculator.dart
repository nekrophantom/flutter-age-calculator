import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewCalculator extends StatefulWidget {
  final Function addAgeCalc;

  const NewCalculator({
    required this.addAgeCalc,
    super.key
  });

  @override
  State<NewCalculator> createState() => _NewCalculatorState();
}

class _NewCalculatorState extends State<NewCalculator> {
  final _nameController = TextEditingController();
  DateTime? _selectedDate;

  void _datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return ;
      }

      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _submitNewAgeCalculator(){
    final inputName = _nameController.text;
    if(inputName.isEmpty || _selectedDate == null) return;

    widget.addAgeCalc(inputName, _selectedDate);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          
          // Name field input
          TextField(
            decoration: const InputDecoration(labelText: 'Name'),
            controller: _nameController,
            style: Theme.of(context).textTheme.labelSmall,
          ),

          const SizedBox(height: 16,),

          // DoB
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text( _selectedDate != null ? DateFormat.yMd().format(_selectedDate!) : 'Choose DoB: ',
              style: Theme.of(context).textTheme.labelSmall,
              ),


              // date Picker
              TextButton(
                onPressed: _datePicker,
                child: const Text('Choose Date!',)
              )
            ],
          ),

          ElevatedButton(
            onPressed: _submitNewAgeCalculator,
            child: Text('Save')
          )
        ],
      ),
    );
  }
}