import 'package:agecalculator/widgets/agecalculator_list.dart';
import 'package:intl/intl.dart';

import '../models/age_calculator.dart';
import 'package:flutter/material.dart';

import '../widgets/new_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   final List<AgeCalculator> _ageCalculators = [
    // AgeCalculator(name: 'Reynold', age: 25, date: DateTime.now()),
    // AgeCalculator(name: 'John', age: 34, date: DateTime.now()),
  ];

  void _addNewAgeCalculator(String pName, DateTime chosenDate){
    final dateYear = DateFormat.y();
    final pAge = int.parse(dateYear.format(DateTime.now())) -  int.parse(dateYear.format(chosenDate));
    final newAgeCalculator = AgeCalculator(
      name: pName,
      age: pAge,
      date: chosenDate
    );

    setState(() {
      _ageCalculators.add(newAgeCalculator);
    });
  }
  

  void _startNewAgeCalculator(BuildContext context){
    showModalBottomSheet(
      context: context,
      builder: (_){
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewCalculator(
            addAgeCalc: _addNewAgeCalculator,
          ),
        );
      } 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: AgeCalculatorList(
        agecalculator: _ageCalculators
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startNewAgeCalculator(context),
        backgroundColor: Colors.blueGrey[200],
        child: const Icon(Icons.add),
      ),
    );
  }
}