import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/views/screens/CreateDisplay.dart';
import 'package:digitaldisplay/views/screens/Responsive/CreateDisplayMobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/Display.dart';
import '../CreateProduct.dart';

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("MOBILE"),
      ),
      backgroundColor: Colors.deepPurple[200],
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(CreateDisplay.routeName);
                      },
                      child: Text("Create Display"),
                      style: buttonStyle2,
                    ),
                  ),
                ],
              ),
              Consumer<DisplayController>(
                builder: (context, value, child) {
                  //log('${value.displays[0].results?.length.toString()}');
                  if (value.displays[0].results!.isNotEmpty) {
                    return GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 1,
                      children: List.generate(
                          value.displays.isNotEmpty
                              ? value.displays[0].results!.length
                              : 0, (i) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DisplayCard(
                            displayName: value.displays[0].results![i].name!,
                            displayImage: value
                                .displays[0].results![i].catalogs![0].image!,
                            id: value.displays[0].results![i].id!,
                          ),
                        );
                      }),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                            .pushNamed(CreateProduct.routeName);
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
        ),
      ),
    );
  }
}
