
import 'dart:io';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class PostRequestForm extends StatefulWidget {
  @override
  _PostRequestFormState createState() => _PostRequestFormState();
}

class _PostRequestFormState extends State<PostRequestForm> {
  bool Uploading = false;

  String dropdownvalue = 'Others';

  // List of items in our dropdown menu
  var items = [
    'Medic',
    'Human',
    'Study',
    'Others',
  ];

String? _validateUpiAddress(String value) {
  if (value.isEmpty) {
    return 'UPI VPA is required.';
  }
  if (value.split('@').length != 2) {
    return 'Invalid UPI VPA';
  }
  return null;
}
  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  void removePostInfo() {
    PostTitle.clear();
    dropdownvalue = "Others";
    _PostDescription.clear();
    _PostCommunity.clear();
    _PostUpi.clear();
    _ReqAmount.clear();

    setState(() {
      // Convert XFile to File
      image = null;
      Uploading = false;
    });
  }

  Future<String> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      String fileName = Path.basename(imageFile.path);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('images/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return Future.error('Failed to upload image');
    }
  }

  displayUploadScreen() {
    return Scaffold(
      appBar: MyAppBar(context, "Request A Post"),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.add_a_photo,
              size: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: ElevatedButton(
                  onPressed: () => pickImage(),
                  child: Text(
                    "Upload A Image From Gallery",
                    style: TextStyle(color: Colors.amber, fontSize: 20.sp),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController PostTitle = TextEditingController();

  TextEditingController _ReqAmount = TextEditingController();

  TextEditingController _PostDescription = TextEditingController();

  TextEditingController _PostCommunity = TextEditingController();

  TextEditingController _PostUpi = TextEditingController();


  ImagePicker _imagePicker = ImagePicker();

  final double _PostProgress = 0;

  final double _ProgressAmount = 0;

  final bool _isactive = false;

  // final ImagePicker _picker = PostRequestForm();

  

  displayPostScreen(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          leading: IconButton(
              onPressed: removePostInfo, icon: Icon(Icons.arrow_back)),
        ),
        body:  
        ListView(
          children: [
            Uploading ? LinearProgressIndicator() : Text(""),
            Container(
              height: 280.0,
              width: MediaQuery.of(context).size.width * 8.0,
              child: image == null
                  ? Text('No image selected.')
                  : Center(
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: FileImage(image!),
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                retextfield("Enter The Upi ID", Icons.payment, false, _PostUpi),
                retextfield(
                    "Enter The Post Title", Icons.title, false, PostTitle),
                retextfield("Enter The Post Description", Icons.nat, false,
                    _PostDescription),
                retextfield("Enter The Post Community", Icons.group, false,
                    _PostCommunity),
                TextField(
                  controller: _ReqAmount,
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true), // Allow decimal input
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(
                        r'[0-9.]')), // Allow digits and dot for decimal input
                  ],
                  decoration: InputDecoration(
                      labelText: 'Enter Amount',
                      hintText: '0.00',
                      icon: Icon(Icons.currency_rupee)),
                ),
                SizedBox(height: 5.h),
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  isExpanded: true,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Column(
              children: [
                blckbtn(context, "Submit", () {
                  controlUploadAndsave();
                })
              ],
            )
          ],
        ));
  }

  @override
  void dispose() {
    PostTitle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return image == null ? displayUploadScreen() : displayPostScreen(context);
  }

  controlUploadAndsave() async {
    setState(() {
      Uploading = true;
    });

    String downloadUrl = await uploadImageToFirebaseStorage(image!);
    String requestAmountText = _ReqAmount.text;
    var requestamount = double.tryParse(requestAmountText);

    UploadToFirebase(
        posttitle: PostTitle.text,
        postcatogory: dropdownvalue,
        requestamount: requestamount,
        postdescription: _PostDescription.text,
        postcommunity: _PostCommunity.text,
        postupi: _PostUpi.text,
        postimage: downloadUrl);

    PostTitle.clear();
    dropdownvalue = "Others";
    _PostDescription.clear();
    _PostCommunity.clear();
    _PostUpi.clear();
    _ReqAmount.clear();

    setState(() {
      image = null;
      Uploading = false;
    });
  }

  UploadToFirebase(
      {String? posttitle,
      String? postcatogory,
      double? requestamount,
      String? postdescription,
      String? postcommunity,
      String? postupi,
      String? postimage}) {
    FirebaseFirestore.instance.collection('PostData').add({
      'PostTitle': posttitle,
      'PostCatogory': postcatogory,
      'RequestAmount': requestamount,
      'PostDescription': postdescription,
      'PostCommunity': postcommunity,
      'PostUpi': postupi,
      'Postimage': postimage,
      'PostProgress': 0,
      'ProgressAmount': 0,
      'isactive': true,
    });
  }
}
  // await FirebaseFirestore.instance.collection('PostData').add({
  //     'PostTitle': _PostTitle,
  //     'PostCatogory': _dropdownvalue,
  //     'RequestAmount': _ReqAmount,
  //     'PostDescription': _PostDescription,
  //     'PostCommunity': _PostCommunity,
  //     'PostUpi': _PostUpi,
  //     'Postimage': _imagePicker,
  //     'PostProgress': _PostProgress,
  //     'ProgressAmount': _ProgressAmount,
  //     'isactive': _isactive,
  //   });