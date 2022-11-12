import 'dart:io';
import 'package:digitaldisplay/controllers/ProductController.dart';
import 'package:digitaldisplay/views/screens/Layout/ProductResponsivelayout.dart';
import 'package:digitaldisplay/views/screens/Mobile/CreateProductMobile.dart';
import 'package:digitaldisplay/views/screens/Tv/CreateProductTv.dart';
import 'package:digitaldisplay/views/widgets/ProductCard.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  static const routeName = "/create-product";

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    Provider.of<ProductController>(context, listen: false).getProducts();
    super.initState();
  }

  String _name = "";
  String _price = "";
  File? image;

  final _form = GlobalKey<FormState>();

  void _createProduct() async {
    var isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save();
    bool create = await Provider.of<ProductController>(context, listen: false)
        .createProduct(_name, _price, image!);

    if (create) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              actions: [
                ElevatedButton(
                  child: const Text("Return"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Failed to create display!"),
              actions: [
                ElevatedButton(
                  child: const Text("Return"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
  }

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
      body: const ProductResponsiveLayout(
          mobileBody: CreateProductMobile(), tvBody: CreateProductTv()),
    );
    //   body: SingleChildScrollView(
    //     child: Form(
    //       key: _form,
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           const SizedBox(height: 20),
    //           // card
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Center(
    //                 child: Container(
    //               width: 900,
    //               decoration: BoxDecoration(
    //                 border: Border.all(color: Colors.grey),
    //                 borderRadius: BorderRadius.circular(2.0),
    //               ),
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                 children: [
    //                   image == null
    //                       ? const Text("No Image Added")
    //                       : Flexible(
    //                           child: Image.file(image!, fit: BoxFit.cover)),

    //                   Flexible(
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(8.0),
    //                       child: ElevatedButton(
    //                         onPressed: () {
    //                           _getProductImage();
    //                           // displayController.createDisplay(
    //                           //     "name", "category", "templateName", "1");
    //                         },
    //                         child: Text("Add Product Image"),
    //                         style: buttonStyle2,
    //                       ),
    //                     ),
    //                   ),

    //                   // Container(
    //                   //   padding: const EdgeInsets.all(8.0),
    //                   //   child: Image.network(
    //                   //     "https://images.template.net/89048/Ecommerce-Product-Flyer-Template.jpeg",
    //                   //     height: 300,
    //                   //     width: 500,
    //                   //     fit: BoxFit.cover,
    //                   //   ),
    //                   // ),

    //                   //ImageFormField(),
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.center,
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     children: [
    //                       Padding(
    //                         padding: EdgeInsets.all(10),
    //                         child: Container(
    //                           width: 400,
    //                           child: TextFormField(
    //                             validator: (value) {
    //                               if (value!.isEmpty) {
    //                                 return "Please Enter Valid Name";
    //                               } else {
    //                                 return null;
    //                               }
    //                             },
    //                             onSaved: (value) {
    //                               _name = value as String;
    //                             },
    //                             autofocus: true,
    //                             style: const TextStyle(
    //                                 fontSize: 15.0, color: Colors.black),
    //                             decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintText: 'Name',
    //                               filled: true,
    //                               fillColor: Colors.white,
    //                               contentPadding: const EdgeInsets.only(
    //                                   left: 14.0, bottom: 6.0, top: 8.0),
    //                               focusedBorder: OutlineInputBorder(
    //                                 borderSide: const BorderSide(
    //                                     color: Color.fromARGB(255, 73, 57, 55)),
    //                                 borderRadius: BorderRadius.circular(0.0),
    //                               ),
    //                               enabledBorder: UnderlineInputBorder(
    //                                 borderSide:
    //                                     const BorderSide(color: Colors.grey),
    //                                 borderRadius: BorderRadius.circular(0.0),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: EdgeInsets.all(10),
    //                         child: Container(
    //                           width: 400,
    //                           child: TextFormField(
    //                             validator: (value) {
    //                               if (value!.isEmpty) {
    //                                 return "Please Enter Valid Name";
    //                               } else {
    //                                 return null;
    //                               }
    //                             },
    //                             onSaved: (value) {
    //                               _price = value as String;
    //                             },
    //                             autofocus: true,
    //                             style: const TextStyle(
    //                                 fontSize: 15.0, color: Colors.black),
    //                             decoration: InputDecoration(
    //                               border: InputBorder.none,
    //                               hintText: 'Product Price',
    //                               filled: true,
    //                               fillColor: Colors.white,
    //                               contentPadding: const EdgeInsets.only(
    //                                   left: 14.0, bottom: 6.0, top: 8.0),
    //                               focusedBorder: OutlineInputBorder(
    //                                 borderSide: const BorderSide(
    //                                     color: Color.fromARGB(255, 73, 57, 55)),
    //                                 borderRadius: BorderRadius.circular(0.0),
    //                               ),
    //                               enabledBorder: UnderlineInputBorder(
    //                                 borderSide:
    //                                     const BorderSide(color: Colors.grey),
    //                                 borderRadius: BorderRadius.circular(0.0),
    //                               ),
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                       // Padding(
    //                       //   padding: EdgeInsets.all(10),
    //                       //   child: Container(
    //                       //     width: 900,
    //                       //     child: TextFormField(
    //                       //       validator: (value) {
    //                       //         if (value!.isEmpty) {
    //                       //           return "Please Enter Valid Name";
    //                       //         } else {
    //                       //           return null;
    //                       //         }
    //                       //       },
    //                       //       onSaved: (value) {
    //                       //         name = value as String;
    //                       //       },
    //                       //       autofocus: true,
    //                       //       style: const TextStyle(
    //                       //           fontSize: 15.0, color: Colors.black),
    //                       //       decoration: InputDecoration(
    //                       //         border: InputBorder.none,
    //                       //         hintText: 'Badge',
    //                       //         filled: true,
    //                       //         fillColor: Colors.white,
    //                       //         contentPadding: const EdgeInsets.only(
    //                       //             left: 14.0, bottom: 6.0, top: 8.0),
    //                       //         focusedBorder: OutlineInputBorder(
    //                       //           borderSide: const BorderSide(
    //                       //               color: Color.fromARGB(255, 73, 57, 55)),
    //                       //           borderRadius: BorderRadius.circular(0.0),
    //                       //         ),
    //                       //         enabledBorder: UnderlineInputBorder(
    //                       //           borderSide:
    //                       //               const BorderSide(color: Colors.grey),
    //                       //           borderRadius: BorderRadius.circular(0.0),
    //                       //         ),
    //                       //       ),
    //                       //     ),
    //                       //   ),
    //                       // ),
    //                       Padding(
    //                         padding: const EdgeInsets.all(8.0),
    //                         child: Container(
    //                           width: 240,
    //                           child: ElevatedButton(
    //                             onPressed: () {
    //                               _createProduct();
    //                             },
    //                             child: Text("Add Text"),
    //                             style: buttonStyle1,
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             )),
    //           ),

    //           // button
    //           Center(
    //             child: Container(
    //               width: 900,
    //               child: Row(
    //                 crossAxisAlignment: CrossAxisAlignment.end,
    //                 mainAxisAlignment: MainAxisAlignment.end,
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.all(8.0),
    //                     child: ElevatedButton(
    //                       onPressed: () {},
    //                       child: Text("Create Product"),
    //                       style: buttonStyle2,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),

    //           // product card
    //           Center(
    //             child: Container(
    //               height: 600,
    //               width: 900,
    //               child: Consumer<ProductController>(
    //                   builder: (context, value, child) {
    //                 return GridView.count(
    //                     crossAxisCount: 4,
    //                     crossAxisSpacing: 10,
    //                     children: List.generate(
    //                         value.products.isNotEmpty
    //                             ? value.products[0].results!.length
    //                             : 0, (i) {
    //                       return ProductCard(
    //                           name: value.products[0].results![i].name!,
    //                           price: value.products[0].results![i].price!,
    //                           image: value.products[0].results![i].image!,
    //                           id: value.products[0].results![i].id!);
    //                     }));
    //               }),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }

  void _getProductImage() async {
    XFile? filepick = await picker.pickImage(source: ImageSource.gallery);
    if (filepick != null) {
      setState(() {
        image = File(filepick.path);
      });
    }
  }
}
