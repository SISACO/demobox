import 'dart:io';

import 'package:Donobox/functions/checkuser.dart';
import 'package:Donobox/functions/validation.dart';
import 'package:Donobox/reuseable/reuseable.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class SigupScrn extends StatefulWidget {
  const SigupScrn({super.key});

  @override
  State<SigupScrn> createState() => _SigupScrnState();
}

class _SigupScrnState extends State<SigupScrn> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =TextEditingController();
  var items = [
    'Female',
    'Male',
    'Others',
  ];
  String dropdownvalue = 'Others';
  bool hidetext = true;
  File? image;
  bool isChanged = false;
  String imgUrl = '';
  bool isLoading = true;
  final formkey = GlobalKey<FormState>();

  Future<String> uploadImageToFirebaseStorage(File imageFile) async {
    try {
      String fileName = Path.basename(imageFile.path);
      Reference firebaseStorageRef =
          FirebaseStorage.instance.ref().child('profile/$fileName');
      UploadTask uploadTask = firebaseStorageRef.putFile(imageFile);
      TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      return Future.error('Failed to upload image');
    }
  }

  void removeUserInfo() {
    _namecontroller.clear();
    dropdownvalue = "Others";
    _emailcontroller.clear();
    _passwordcontroller.clear();
    _confirmpasswordcontroller.clear();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, 'SignUp'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(18).h,
              padding: const EdgeInsets.all(18).h,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 217, 0),
                      width: 2.0),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    //avatar

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        image == null
                            ? Text('No image selected.')
                            : CircleAvatar(
                                maxRadius: 40,
                                backgroundImage: FileImage(image!),
                                // backgroundImage: NetworkImage("https://firebasestorage.googleapis.com/v0/b/donobox-9e4c6.appspot.com/o/images%2FIMG-20240309-WA0014.jpg?alt=media&token=fc6335ff-ef2d-4b19-9ea8-70ad4539e4e5"),
                              )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pickImage();
                      },
                      child: Text(
                        "Add Profile Photo",
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amberAccent),
                    ),
                    SizedBox(
                      height: 22.h,
                    ),
                    //name
                    TextFormField(
                      controller: _namecontroller,
                      validator: validateName,
                      cursorColor: const Color.fromARGB(255, 214, 196, 4),
                      style: TextStyle(color: Colors.black12.withOpacity(0.9)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_pin,
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.8),
                          size: 20,
                        ),
                        labelText: 'Name',
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 217, 0),
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4)),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        fillColor: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //email
                    TextFormField(
                      controller: _emailcontroller,
                      validator: validateEmail,
                      cursorColor: const Color.fromARGB(255, 214, 196, 4),
                      style: TextStyle(color: Colors.black12.withOpacity(0.9)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.8),
                          size: 20,
                        ),
                        labelText: 'Email Address',
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 217, 0),
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4)),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        fillColor: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DropdownButtonFormField(
                      iconEnabledColor: Colors.amber,
                      // Initial Value
                      value: dropdownvalue,
                      isExpanded: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Gender',
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 217, 0),
                          ),
                        ),
                      ),
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
                    SizedBox(
                      height: 20,
                    ),

                    //password
                    TextFormField(
                      controller: _passwordcontroller,
                      validator: validatePass,
                      obscureText: hidetext,
                      cursorColor: const Color.fromARGB(255, 214, 196, 4),
                      style: TextStyle(color: Colors.black12.withOpacity(0.9)),
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                hidetext = !hidetext;
                              });
                            },
                            icon: hidetext
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        prefixIcon: Icon(
                          Icons.person,
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.8),
                          size: 20,
                        ),
                        labelText: 'Password',
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 217, 0),
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4)),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        fillColor: Colors.white.withOpacity(0.3),
                      ),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //confirm pass
                    TextFormField(
                      obscureText: true,
                      controller: _confirmpasswordcontroller,
                      validator: (value) {
                        if (_passwordcontroller.text != value) {
                          return "Password doesn't match";
                        }
                        return null;
                      },
                      cursorColor: const Color.fromARGB(255, 214, 196, 4),
                      style: TextStyle(color: Colors.black12.withOpacity(0.9)),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.8),
                          size: 20,
                        ),
                        labelText: 'Confirm Password',
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(255, 199, 40, 40),
                            width: 1.0,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 217, 0),
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)
                                .withOpacity(0.4)),
                        filled: true,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        fillColor: Colors.white.withOpacity(0.3),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    reButton('SignUp', true, () async {
                      
                      if (formkey.currentState!.validate()) {
                        if (image == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Select a profile picture')),
                          );
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    content: Text('Loading'),
                                  ));

                          String downloadUrl =
                              await uploadImageToFirebaseStorage(image!);

                          signupUser(
                                  context,
                                  _namecontroller,
                                  _emailcontroller,
                                  _passwordcontroller,
                                  downloadUrl,
                                  dropdownvalue)
                              .whenComplete(() => removeUserInfo());
                        }
                      }
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          CircularProgressIndicator(),
          Container(
              margin: EdgeInsets.only(left: 7), child: Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
}
