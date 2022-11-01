import 'package:digitaldisplay/views/widgets/ProductCard.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  static const routeName = "/create-product";

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle1 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFc3232a),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );
    final ButtonStyle buttonStyle2 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF111111),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF111111),
        title: const Text(
          "Create Product",
          textAlign: TextAlign.end,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // card
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Container(
                width: 1600,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Image.network(
                    //     "https://images.template.net/89048/Ecommerce-Product-Flyer-Template.jpeg",
                    //     height: 300,
                    //     width: 500,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),

                    //ImageFormField(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 900,
                            child: TextField(
                              autofocus: true,
                              style: const TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Name',
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 6.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 73, 57, 55)),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 900,
                            child: TextField(
                              autofocus: true,
                              style: const TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Product Price',
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 6.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 73, 57, 55)),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                            width: 900,
                            child: TextField(
                              autofocus: true,
                              style: const TextStyle(
                                  fontSize: 15.0, color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Badge',
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.only(
                                    left: 14.0, bottom: 6.0, top: 8.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 73, 57, 55)),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 240,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text("Add Text"),
                              style: buttonStyle1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
            ),

            // button
            Center(
              child: Container(
                width: 1600,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Create Product"),
                        style: buttonStyle2,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // product card
            Center(
              child: Container(
                height: 600,
                width: 1600,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  physics: const ScrollPhysics(),
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 15,
                  shrinkWrap: true,
                  crossAxisCount: 4,
                  children: List.generate(8, (index) => const ProductCard()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
