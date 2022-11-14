// ignore_for_file: sized_box_for_whitespace
import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/controllers/ProductController.dart';
import 'package:digitaldisplay/models/DisplayModel.dart';
import 'package:digitaldisplay/views/widgets/Display.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class CreateDisplayTv extends StatefulWidget {
  const CreateDisplayTv({super.key});
  @override
  State<CreateDisplayTv> createState() => _CreateDisplayTvState();
}

class _CreateDisplayTvState extends State<CreateDisplayTv> {
  final ImagePicker picker = ImagePicker();
  int? isSelected;

  String _name = "";
  String _category = "";
  String _templateName = "";
  File? catalogImage;
  File? _catalogVideo;
  List<int> productIds = [];

  final _form = GlobalKey<FormState>();

  // DisplayController displayController = DisplayController();

  void _addDisplay() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    bool create = await Provider.of<DisplayController>(context, listen: false)
        .addDisplay(_name, _category, _templateName, catalogImage!,
            _catalogVideo!, productIds);
    if (create) {
      print(create);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Created"),
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
  void initState() {
    Provider.of<DisplayController>(context, listen: false).getDisplays();
    Provider.of<ProductController>(context, listen: false).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle1 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFc3232a),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );
    final ButtonStyle buttonStyle2 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFFc3232a),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );
    final ButtonStyle buttonStyle3 = ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF111111),
      shape: const StadiumBorder(),
      minimumSize: const Size(100, 50),
    );

    double maxHeight = MediaQuery.of(context).size.height;
    double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFf5f5f5f5),
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: const Color(0xFF111111),
      //   title: const Text(
      //     "Digital Display Generator",
      //     textAlign: TextAlign.end,
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  height: 360,
                  width: double.infinity,
                  child: Consumer<DisplayController>(
                    builder: (context, value, child) {
                      return GridView.count(
                        physics: const ScrollPhysics(),
                        // childAspectRatio: 2,
                        shrinkWrap: true,
                        crossAxisSpacing: 3,
                        // mainAxisSpacing: 2,
                        crossAxisCount: 1,

                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            value.displays.isNotEmpty
                                ? value.displays[0].results!.length
                                : 0, (i) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: DisplayCard(
                                displayName:
                                    value.displays[0].results![i].name!,
                                displayImage: value.displays[0].results![i]
                                    .catalogs![0].image!,
                                id: value.displays[0].results![i].id!),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: maxWidth * 0.8,
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: maxWidth * 0.8,
                    color: Colors.grey,
                  ),
                ],
              ),

              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: maxWidth * 0.8,
                    color: Colors.black,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "https://www.123123123123.com/watch-display-1212",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 45,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // alignment: Alignment.center,
                    height: 2,
                    width: maxWidth * 0.8,
                    color: Colors.grey,
                  ),
                ],
              ),
              Container(
                height: 45,
              ),
              Center(
                child: Container(
                  height: 180,
                  width: maxWidth * 0.8,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFF5F5F5),
                          blurRadius: 1,
                          spreadRadius: 1,
                        )
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return "Please Enter a valid name";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  _name = value as String;
                                },
                                autofocus: false,
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
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return "Please enter valid template name";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  _templateName = value as String;
                                },
                                autofocus: false,
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Template Name',
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
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: TextFormField(
                                validator: (v) {
                                  if (v!.isEmpty) {
                                    return "Please Enter a valid name";
                                  } else {
                                    return null;
                                  }
                                },
                                onSaved: (value) {
                                  _category = value as String;
                                },
                                autofocus: false,
                                style: const TextStyle(
                                    fontSize: 15.0, color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: 'Category Name',
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
                          )
                        ],
                      ),
                      // const SizedBox(height: 220),
                    ],
                  ),
                ),
              ),
              Text("Select Product"),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Consumer<ProductController>(
                    builder: ((context, value, child) {
                      // log('${value.products[0].results?.length.toString()}');
                      if (value.products.isNotEmpty) {
                        return Container(
                            width: 900,
                            height: maxHeight * 0.3,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: value.products[0].results!.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  child: ListTile(
                                    title: Text(value
                                        .products[0].results![index].name!),
                                    leading: IconButton(
                                      icon: const Icon(Icons.add),
                                      onPressed: () {
                                        setState(() {
                                          var ids = value
                                              .products[0].results![index].id!;
                                          if (productIds.contains(ids)) {
                                            productIds.remove(ids);
                                          } else {
                                            productIds.add(ids);
                                            isSelected = index;
                                          }
                                          // productIds.add(value.products[0]
                                          //     .results![index].id!);

                                          print("products=>>>> $productIds");
                                        });
                                      },
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.done,
                                        color: isSelected == index
                                            ? Colors.blue
                                            : null,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          productIds.remove(value
                                              .products[0].results![index].id);
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                            ));
                      } else {
                        return const CircularProgressIndicator();
                      }
                    }),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.network(
                                "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                                height: 300,
                                width: 300),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _getImageFromGallery();
                                  // displayController.createDisplay(
                                  //     "name", "category", "templateName", "1");
                                },
                                child: Text("Add Image"),
                                style: buttonStyle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.network(
                                "https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg",
                                height: 300,
                                width: 300),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _getVideoFromGallery();
                                  // displayController.createDisplay(
                                  //     "name", "category", "templateName", "1");
                                },
                                child: Text("Add Video"),
                                style: buttonStyle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _addDisplay();
                    // displayController.createDisplay(
                    //     "name", "category", "templateName", "1");
                  },
                  child: Text("Add Display"),
                  style: buttonStyle2,
                ),
              ),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //         width: 900,
              //         child: const Padding(
              //           padding: EdgeInsets.all(8.0),
              //           child: ProductDisplayCard(),
              //         )),
              //   ],
              // ),
              const SizedBox(height: 20),
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
                      onPressed: () {},
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

  void _getImageFromGallery() async {
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        catalogImage = File(pickedFile.path);
      });
    }
  }

  void _getVideoFromGallery() async {
    XFile? filepick = await picker.pickImage(source: ImageSource.gallery);
    if (filepick != null) {
      setState(() {
        _catalogVideo = File(filepick.path);
      });
    }
  }
}
