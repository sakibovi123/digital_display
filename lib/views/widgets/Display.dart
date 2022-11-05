import 'package:flutter/material.dart';
import 'package:responsive_toolkit/responsive_toolkit.dart';

class DisplayCard extends StatelessWidget {
  final String displayName;
  final String displayImage;
  // final String location;
  // final String displayStyle;
  // final String displayImage;

  DisplayCard({required this.displayName, required this.displayImage});

  // const DisplayCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle1 = ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      shape: const StadiumBorder(),
    );

    final ButtonStyle buttonStyle2 = ElevatedButton.styleFrom(
      backgroundColor: Color(0xFFc3232a),
      shape: const StadiumBorder(),
    );

    return Container(
      margin: const EdgeInsets.all(10.0),
      alignment: Alignment.center,
      height: 300.0,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFffffff),
              //offset: Offset(2, 2),
              blurRadius: 0.5,
              spreadRadius: 1.0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 55.0,
                width: 120.0,
                //color: Colors.black,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    //margin: EdgeInsets.all(10.0),
                    color: Colors.black,
                    elevation: 10.0,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Dhanmondi",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 55.0,
                width: 120.0,
                //color: Colors.black,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    //margin: EdgeInsets.all(10.0),
                    color: Colors.black,
                    elevation: 10.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        displayName,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Image.network(
            "https://digital-display.betafore.com/$displayImage",
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          ),
          Container(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Edit Display"),
                style: buttonStyle1,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("View Display"),
                style: buttonStyle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
