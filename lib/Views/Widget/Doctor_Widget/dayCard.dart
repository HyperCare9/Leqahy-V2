import 'package:flutter/material.dart';
import '../../../Constant/theme.dart';

dayCard({dynamic size, String? day, String? date}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Text(
            day!,
            style: MyTheme.lightTheme.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.01),
          Text(
            date!,
            style: MyTheme.lightTheme.textTheme.subtitle1!
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}
