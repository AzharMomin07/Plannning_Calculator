import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

class Cards extends StatelessWidget {
  const Cards({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        // Set shrinkWrap to true
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        padding: const EdgeInsets.all(15),
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context,
                  "DreamCarPlanning"); // Handle tap on the first container
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage("assets/images/car.jpg"),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "Car",
                          style: AppConstants.titleTextStyle,
                            // color: Colors.indigo,
                            // fontSize: 18,
                            // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          ///////////////////////////////////////////////////////
          InkWell(
            onTap: () {
              Navigator.pushNamed(context,
                  "DreamHousePlanning"); // Handle tap on the first container
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage("assets/images/house.jpg"),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "House", // Replace with the desired name
                          style: AppConstants.titleTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ///////////////////////////////////////
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                  context, "DreamVacationPlanning"); // Handle tap on the first container
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage("assets/images/vac.png"),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Vacation", // Replace with the desired name
                          style: AppConstants.titleTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //////////////////////////////////////////////
          InkWell(
            onTap: () {
              // Handle tap on the first container
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage("assets/images/retirement.png"),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  onTap: () {
                    // Handle tap on the first container
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Retirement", // Replace with the desired name
                          style: AppConstants.titleTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //////////////////////////////////////////////////////
          InkWell(
            onTap: () {
              Navigator.pushNamed(context,
                  'SIP'); // Handle tap on the first container
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage("assets/images/emi.png"),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  // onTap: () {
                  //
                  //   // Handle tap on the first container
                  // },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Sip-O-Meter", // Replace with the desired name
                          style: AppConstants.titleTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //////////////////////////////////////////////////////
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "ChildEducationPlanning");// Handle tap on the first container
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                image: const DecorationImage(
                  image: AssetImage("assets/images/edu.png"),
                  // fit: BoxFit.cover,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.5),
                  highlightColor: Colors.transparent,
                  // onTap: () {
                  //   // Handle tap on the first container
                  // },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Education",
                          // Replace with the desired name
                          style: AppConstants.titleTextStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]);
  }
}
          // InkWell(
          //   onTap: () {
          //     // Handle tap on the first container
          //   },
          //   child: Container(
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       color: Colors.white,
          //       image: const DecorationImage(
          //         image: AssetImage("assets/images/vacation5.png"),
          //         // fit: BoxFit.cover,
          //       ),
          //     ),
          //     child: Material(
          //       color: Colors.transparent,
          //       child: InkWell(
          //         splashColor: Colors.white.withOpacity(0.5),
          //         highlightColor: Colors.transparent,
          //         onTap: () {
          //           // Handle tap on the first container
          //         },
          //         child: const Column(
          //           mainAxisAlignment: MainAxisAlignment.end,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Padding(
          //               padding: EdgeInsets.all(8.0),
          //               child: Text(
          //                 "Dream Vacation", // Replace with the desired name
          //                 style: TextStyle(
          //                   color: Colors.indigo,
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.bold,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
// //////////////////////////////////////////////////////
// //
//           InkWell(
//             onTap: () {
//               // Handle tap on the first container
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: Colors.white,
//                 image: const DecorationImage(
//                   image: AssetImage("assets/images/goalPlanning4.jpg"),
//                   // fit: BoxFit.cover,
//                 ),
//               ),
//               child: Material(
//                 color: Colors.transparent,
//                 child: InkWell(
//                   splashColor: Colors.white.withOpacity(0.5),
//                   highlightColor: Colors.transparent,
//                   onTap: () {
//                     // Handle tap on the first container
//                   },
//                   child: const Column(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text(
//                           "Goal Planning", // Replace with the desired name
//                           style: TextStyle(
//                             color: Colors.indigo,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),

          // children: [
          //   Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue)),
          //   Container(color: Colors.green),
          //   Container(color: Colors.white),
          //   Container(color: Colors.red),
          //   Container(color: Colors.orange),
          //   Container(color: Colors.blueGrey),

