import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/views/screens/CreateDisplay.dart';
import 'package:digitaldisplay/views/screens/CreateProduct.dart';
import 'package:digitaldisplay/views/widgets/Display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TvBody extends StatefulWidget {
  const TvBody({super.key});

  @override
  State<TvBody> createState() => _TvBodyState();
}

class _TvBodyState extends State<TvBody> {
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
        title: const Text("DIGITAL DISPLAY"),
        backgroundColor: Colors.black,
      ),
      // backgroundColor: Colors.deepOrange[300],
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
              Consumer<DisplayController>(
                builder: (context, value, child) {
                  //log('${value.displays[0].results?.length.toString()}');
                  if (value.displays[0].results!.isNotEmpty) {
                    return GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      crossAxisCount: 4,
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
            ],
          ),
        ),
      ),
    );
  }
}
