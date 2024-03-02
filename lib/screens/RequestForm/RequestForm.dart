import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PostRequestForm extends StatefulWidget {
  File file;
  PostRequestForm({super.key, required this.file});

 

  @override
  State<PostRequestForm> createState() => _PostRequestFormState();
}

class _PostRequestFormState extends State<PostRequestForm> {
  final TextEditingController _PostTitle = TextEditingController();
  final TextEditingController _ReqAmount = TextEditingController();
  final TextEditingController _PostDescription = TextEditingController();
  final TextEditingController _PostCommunity = TextEditingController();
  final TextEditingController _PostUpi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
