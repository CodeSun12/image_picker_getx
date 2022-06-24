import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_getx/Controller/selectImage_controller.dart';

class SelectImageScreen extends StatefulWidget {
  const SelectImageScreen({Key? key}) : super(key: key);

  @override
  State<SelectImageScreen> createState() => _SelectImageScreenState();
}

class _SelectImageScreenState extends State<SelectImageScreen> {

  final imageController = Get.put(SelectImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Center(
            child: Text(
          "Select Image",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white),
        )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Obx(() => imageController.selectImagePath.value == ''
                ? Text("Select Image From Camera / Gallery", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),)
                : Image.file(File(imageController.selectImagePath.value))
            ),
            // SizedBox(height: 25,),
            // Obx(() => Text(imageController.selectImageSize==''?'': imageController.selectImageSize.value)
            // ),
            SizedBox(height: 20,),
            Center(
              child: MaterialButton(
                color: Colors.black87,
                onPressed: (){
                  imageController.getImage(ImageSource.camera);
                },
                child: const Text("From Camera", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
              ),
            ),
            const SizedBox(height: 15,),
            Center(
              child: MaterialButton(
                color: Colors.teal,
                onPressed: (){
                  imageController.getImage(ImageSource.gallery);
                },
                child: const Text("From Gallery", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
