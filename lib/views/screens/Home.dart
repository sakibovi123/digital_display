import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/views/screens/Mobile/MobileBody.dart';
import 'package:digitaldisplay/views/screens/Mobile/TvBody.dart';
import 'package:digitaldisplay/views/widgets/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';

import 'Layout/ResponsiveLayout.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<DisplayController>(context, listen: false).getDisplays();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle2 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF111111),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );
    final ButtonStyle buttonStyle1 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFc3232a),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );
    return const Scaffold(
      // backgroundColor: const Color(0xFFf5f5f5),
      // drawer: const NavBar(),
      // appBar: AppBar(
      //   leading: const Icon(Icons.menu, color: Colors.black),
      //   title: const Text(
      //     "Digital Display",
      //     style: TextStyle(
      //       fontStyle: FontStyle.italic,
      //       color: Color(0xFF111111),
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   backgroundColor: const Color(0xFFe9e9ff),
      //   elevation: 0,
      // ),
      body: ResponsiveLayoutBuilder(
        mobileBody: MobileBody(),
        tvBody: TvBody(),
      ),
      // body: Column(
      //   children: [
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: ElevatedButton(
      //             onPressed: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => const CreateDisplay()),
      //               );
      //             },
      //             child: Text("Create Display"),
      //             style: buttonStyle2,
      //           ),
      //         ),
      //       ],
      //     ),
      //     Flexible(
      //       child: Consumer<DisplayController>(
      //         builder: (context, value, child) {
      //           //log('${value.displays[0].results?.length.toString()}');
      //           if (value.displays[0].results!.isNotEmpty) {
      //             return GridView.count(
      //               crossAxisCount: 4,
      //               children: List.generate(
      //                   value.displays.isNotEmpty
      //                       ? value.displays[0].results!.length
      //                       : 0, (i) {
      //                 return ResponsiveGridList(
      //                   desiredItemWidth: 400,
      //                   minSpacing: 10,
      //                   children: [
      //                     DisplayCard(
      //                       displayName: value.displays[0].results![i].name!,
      //                       displayImage: value
      //                           .displays[0].results![i].catalogs![0].image!,
      //                       id: value.displays[0].results![i].id!,
      //                     )
      //                   ],
      //                 );
      //               }),
      //             );
      //           } else {
      //             return const Center(
      //               child: CircularProgressIndicator(),
      //             );
      //           }
      //         },
      //       ),
      //     ),
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: ElevatedButton(
      //             onPressed: () {},
      //             child: Text("Dashboard"),
      //             style: buttonStyle1,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: ElevatedButton(
      //             onPressed: () {
      //               Navigator.of(context).pushNamed(CreateProduct.routeName);
      //             },
      //             child: Text("Create Product"),
      //             style: buttonStyle2,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: ElevatedButton(
      //             onPressed: () {},
      //             child: Text("Logout"),
      //             style: buttonStyle2,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
