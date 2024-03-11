import 'dart:io';

import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FilePicker extends StatefulWidget {
  @override
  _FilePickerState createState() => _FilePickerState();
}

class _FilePickerState extends State<FilePicker> {
  late File selectedImage;
  bool _isLoading = false;

  Future getImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(image!
          .path); //A value of type 'XFIle' can't be assigned to a variable of type 'File' error.
    });
  }

  final TextEditingController _PostTitle = TextEditingController();

  final TextEditingController _ReqAmount = TextEditingController();

  final TextEditingController _PostDescription = TextEditingController();

  final TextEditingController _PostCommunity = TextEditingController();

  final TextEditingController _PostUpi = TextEditingController();

  // final ImagePicker _picker = FilePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'Post Request'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          retextfield("Enter The Post Title", Icons.title, false, _PostTitle),
          
          retextfield(
              "Enter The Post Description", Icons.nat, false, _PostTitle),
          retextfield(
              "Enter The Post Community", Icons.group, false, _PostCommunity),
          retextfield("Enter The Required Amount", Icons.currency_rupee, false,
              _ReqAmount),
          retextfield("Enter The Upi ID", Icons.payment, false, _PostUpi),
          ElevatedButton.icon(
              onPressed: () => FilePicker(),
              icon: Icon(Icons.upload_file),
              label: Text("Upload the Post Picture"))
        ],
      ),
    );
  }
}
