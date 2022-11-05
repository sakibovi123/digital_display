import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/views/screens/CreateDisplay.dart';
import 'package:digitaldisplay/views/screens/CreateProduct.dart';
import 'package:digitaldisplay/views/widgets/NavBar.dart';
import 'package:digitaldisplay/views/widgets/Package.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../widgets/Display.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _init = true;

  bool _loadingDisplay = false;

  @override
  void didChangeDependencies() async {
    if (_init) {
      _loadingDisplay =
          await Provider.of<DisplayController>(context).getDisplays();

      setState(() {});
    }
    _init = false;
    super.didChangeDependencies();
  }

  DisplayController displayController = DisplayController();

  @override
  Widget build(BuildContext context) {
    final displays = Provider.of<DisplayController>(context).displays;

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
    return Scaffold(
      backgroundColor: const Color(0xFFf5f5f5),
      drawer: const NavBar(),
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text(
          "Digital Display",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Color(0xFF111111),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFFe9e9ff),
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CreateDisplay()),
                    );
                  },
                  child: Text("Create Display"),
                  style: buttonStyle2,
                ),
              ),
            ],
          ),
          // Flexible(
          //   child: GridView.count(
          //       crossAxisCount: 3,
          //       children: List.generate(
          //           displays.results,
          //           (i) => DisplayCard(
          //                 displayName: "displays[i].results!",
          //               ))),
          // ),
          Flexible(
            child: FutureBuilder(
                future: displayController.getallDisplay(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.count(
                        physics: const ScrollPhysics(),
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        children: List.generate(
                            snapshot.data?["results"].length, (i) {
                          return DisplayCard(
                            displayName: snapshot.data["results"]?[i]["name"],
                            displayImage: snapshot.data["results"]?[i]
                                ["catalogs"][0]["image"],
                          );
                        }));
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Dashboard"),
                  style: buttonStyle1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(CreateProduct.routeName);
                  },
                  child: Text("Create Product"),
                  style: buttonStyle2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Logout"),
                  style: buttonStyle2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
