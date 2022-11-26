import 'package:flutter/material.dart';

loading() {
  return Center(
      child: Image.asset(
    'assets/images/loading.gif',
    width: 100,
    height: 100,
  ));
}


// Card(
//       color: Colors.grey[100],
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       child: const Padding(
//         padding: EdgeInsets.all(5.0),
//         child: SpinKitCubeGrid(color: mainColor),
//       ),
//     ),