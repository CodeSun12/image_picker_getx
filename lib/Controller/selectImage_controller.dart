
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageController extends GetxController{

  var selectImagePath = ''.obs;
  var selectImageSize = ''.obs;

  // Function For Getting Picking Image
  void getImage(ImageSource imageSource) async{
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if(pickedFile != null){
      selectImagePath = pickedFile.path;
      // selectImageSize = (((File(selectImagePath.value)).lengthSync()/1024/1024).toStringAsFixed(2) + "Mb");
    }else{
      Get.snackbar(
          "Error",
          "No Image Selected",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.shade100,
        colorText: Colors.black
      );
    }
  }

}