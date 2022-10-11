import 'package:flutter/material.dart';

class Package extends StatelessWidget {
  const Package({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 250.0,
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(5.0),
        color: const Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Simple - \$25/m",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.green,
                      ),
                      Text(
                        "Manage 5 Display"
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.green,
                      ),
                      Text(
                          "Manage 5 Display"
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.green,
                      ),
                      Text(
                          "Manage 5 Display"
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.green,
                      ),
                      Text(
                          "Manage 5 Display"
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.arrow_right,
                        color: Colors.green,
                      ),
                      Text(
                          "Manage 5 Display"
                      ),
                    ],
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
