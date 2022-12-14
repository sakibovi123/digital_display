// ignore_for_file: sized_box_for_whitespace
import 'dart:developer';

import 'package:digitaldisplay/controllers/DisplayController.dart';
import 'package:digitaldisplay/controllers/ProductController.dart';
import 'package:digitaldisplay/models/DisplayModel.dart';
import 'package:digitaldisplay/views/widgets/Display.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class EditDisplayMobile extends StatefulWidget {
  static const routeName = "/edit-display";

  const EditDisplayMobile({super.key});

  @override
  State<EditDisplayMobile> createState() => _EditDisplayMobileState();
}

class _EditDisplayMobileState extends State<EditDisplayMobile> {
  final ImagePicker picker = ImagePicker();

  String _name = "";
  String _category = "";
  String _templateName = "";
  File? catalogImage;
  File? _catalogVideo;
  List<int> productIds = [];

  final _form = GlobalKey<FormState>();
  void _editDisplay() async {
    var isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    bool edit = await Provider.of<DisplayController>(context, listen: false)
        .editDisplay(_name, _category, _templateName, catalogImage!,
            _catalogVideo!, productIds);
    if (edit) {
      print(edit);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Updated!"),
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
              title: Text("Failed to update display data!"),
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
    bool isSelected = false;
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

    final id = ModalRoute.of(context)!.settings.arguments;
    final display_obj =
        Provider.of<DisplayController>(context).singleDisplay(id as int);

    final displayName = display_obj.name;
    final displayTemplateName = display_obj.templateName;
    final displayCategoryName = display_obj.category;

    return Scaffold(
        // backgroundColor: Colors.deepPurple[200],
        // appBar: AppBar(
        //   elevation: 0,
        //   backgroundColor: const Color(0xFF111111),
        //   title: const Text(
        //     "Digital Display Generator",
        //     textAlign: TextAlign.end,
        //   ),
        // ),
        body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<DisplayController>(
              builder: (context, value, child) {
                log('${value.displays[0].results?.length.toString()}');
                return Container(
                  height: maxHeight * 0.6,
                  width: maxWidth * 0.9,
                  child: GridView.count(
                    crossAxisSpacing: 5,
                    crossAxisCount: 1,
                    scrollDirection: Axis.horizontal,
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
                            id: value.displays[0].results![i].id!),
                      );
                    }),
                  ),
                );
              },
            ),
          ],
        ),
        Form(
          key: _form,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Enter Name",
                    )),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: displayName,
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
                    style: const TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
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
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Enter Template Name",
                    )),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: displayTemplateName,
                    validator: (v) {
                      if (v!.isEmpty) {
                        return "Please Enter a valid name";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _templateName = value as String;
                    },
                    autofocus: false,
                    style: const TextStyle(fontSize: 15.0, color: Colors.black),
                    decoration: InputDecoration(
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
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Enter Category Name",
                    )),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    initialValue: displayCategoryName,
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
                    style: const TextStyle(fontSize: 15.0, color: Colors.black),
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
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                    ),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "Select Product",
                    )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Consumer<ProductController>(
                    builder: ((context, value, child) {
                      // log('${value.products[0].results?.length.toString()}');
                      if (value.products.isNotEmpty) {
                        return Container(
                            height: maxHeight * 0.3,
                            child: ListView.builder(
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
                                          productIds.add(value
                                              .products[0].results![index].id!);

                                          isSelected = true;
                                          print("products=>>>> $productIds");
                                        });
                                      },
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(
                                        Icons.done,
                                        color: isSelected == true
                                            ? Colors.blue
                                            : Colors.red,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          productIds.remove(value
                                              .products[0].results![index].id);

                                          isSelected = false;
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _getImageFromGallery();
                          // displayController.createDisplay(
                          //     "name", "category", "templateName", "1");
                        },
                        child: Text("Add Image"),
                        style: buttonStyle1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _getVideoFromGallery();
                          // displayController.createDisplay(
                          //     "name", "category", "templateName", "1");
                        },
                        child: Text("Add Video"),
                        style: buttonStyle1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          _editDisplay();
                        },
                        child: Text("Add Display"),
                        style: buttonStyle2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
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
    XFile? filepick = await picker.pickVideo(source: ImageSource.gallery);
    if (filepick != null) {
      setState(() {
        _catalogVideo = File(filepick.path);
      });
    }
  }
}
