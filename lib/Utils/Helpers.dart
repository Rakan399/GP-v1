import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:myapp/Utils/Constant.dart';

import 'Constant.dart';

onGetPlateNumber(File? image) async {
  // final regions = ['mx', 'sa']; // Change to your country
  final file = image;
  final url = Uri.parse('https://api.platerecognizer.com/v1/plate-reader/');
  final request = http.MultipartRequest('POST', url)
    ..headers['Authorization'] =
        'Token 9fc455d83fb490164b378cfe8e41f9686d2dd616'
    ..fields['detection_mode'] = "vehicle"
    ..files.add(await http.MultipartFile.fromPath('upload', file!.path));

  try {
    final response = await http.Response.fromStream(await request.send());

    var myJson = json.decode(response.body);
    print(myJson);
    return myJson["results"][0]["plate"].toUpperCase();
  } catch (e) {
    print("error get plate $e");
  }
}

Future<File> onPickImage(ImageSource source) async {
  final ImagePicker picker = ImagePicker();
  XFile? _image = await picker.pickImage(source: source);

  if (_image != null) {
    File image = File(_image.path);
    return image;
  }
  return File("");
}

Color get_color_by_status(String status) {
  if (statuses.avaliable.name == status) {
    return Colors.green;
  } else if (statuses.found.name == status) {
    return Colors.yellow;
  } else {
    return Colors.red;
  }
}
