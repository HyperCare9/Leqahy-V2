// import 'package:flutter/material.dart';
// import '../../Screens/HomeScreen/homeScreen.dart';

// Widget buildPage({
//   required double xOffSet,
//   required double yOffSet,
//   required double scaleFactor,
//   required VoidCallback openDrawer,
//   required VoidCallback closeDrawer,
//   required bool isOpenDrawer,
// }) {
//   return GestureDetector(
//     onTap: closeDrawer,
//     child: AnimatedContainer(
//       duration: const Duration(milliseconds: 250),
//       transform: Matrix4.translationValues(xOffSet, yOffSet, 0)
//         ..scale(scaleFactor),
//       child: AbsorbPointer(
//           absorbing: isOpenDrawer,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(isOpenDrawer ? 25 : 0),
//             child: HomeScreen(openDrawer: openDrawer),
//           )),
//     ),
//   );
// }