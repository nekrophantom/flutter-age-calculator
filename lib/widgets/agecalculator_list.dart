import 'package:intl/intl.dart';

import '../models/age_calculator.dart';
import 'package:flutter/material.dart';

class AgeCalculatorList extends StatelessWidget {
  final List<AgeCalculator> agecalculator;

  const AgeCalculatorList({
    required this.agecalculator,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: agecalculator.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.all(12),
          child: Card(
              child: Container(
                padding: const EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(agecalculator[index].name, style: Theme.of(context).textTheme.titleMedium,),
                        
                        // date of birth
                        Text(DateFormat.yMMMd().format(agecalculator[index].date), style: Theme.of(context).textTheme.bodyMedium,)
                      ],
                    ),
                    
                    // age
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Text(
                        agecalculator[index].age.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      )
                    ),
                  ]
                ),
              ),
            ),
        );
      }
    );
  }
}