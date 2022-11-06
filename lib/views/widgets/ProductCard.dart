import 'package:digitaldisplay/views/screens/EditProduct.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  int id;
  String name;
  String price;
  String image;

  // const ProductCard({super.key, required this.name, required this.price, required this.image});

  ProductCard(
      {required this.id,
      required this.name,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context)
                .pushNamed(EditProduct.routeName, arguments: id);
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Opacity(
              opacity: 0.5,
              child: Image.network(
                  "https://digital-display.betafore.com/$image",
                  fit: BoxFit.cover,
                  height: 600,
                  width: double.infinity
                  // opacity: ,
                  ),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
              child: Center(
                  child: Text(
                name,
                style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFffffff)),
              )),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(6.0),
                  bottomRight: Radius.circular(6.0),
                ),
              ),
              child: Center(
                  child: Text("\$${price}",
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold))),
            ),
          ],
        ),
      ],
    );
  }
}
