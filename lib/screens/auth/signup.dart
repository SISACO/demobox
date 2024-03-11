import 'package:Donobox/functions/checkuser.dart';
import 'package:Donobox/functions/validation.dart';
import 'package:Donobox/reuseable/reuseable.dart';
import 'package:flutter/material.dart';
import 'package:Donobox/widgets/appbar/AppBar.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigupScrn extends StatefulWidget {
  const SigupScrn({super.key});

  @override
  State<SigupScrn> createState() => _SigupScrnState();
}

class _SigupScrnState extends State<SigupScrn> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmpasswordcontroller =
      TextEditingController();
  var items = [
    'Female',
    'Male',
    'Others',
  ];
  String dropdownvalue = 'Others';
  bool hidetext = true;

  bool agreeTerms = false;
  bool isChanged = false;

  final formkey = GlobalKey<FormState>();

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
                    SizedBox(height: 20,),

                    // //username
                    // TextFormField(
                    //   controller: _usernamecontroller,
                    //   validator: validateUsern,
                    //   cursorColor: const Color.fromARGB(255, 214, 196, 4),
                    //   style: TextStyle(color: Colors.black12.withOpacity(0.9)),
                    //   decoration: InputDecoration(
                    //     prefixIcon: Icon(
                    //       Icons.person,
                    //       color: const Color.fromARGB(255, 0, 0, 0)
                    //           .withOpacity(0.8),
                    //       size: 20,
                    //     ),
                    //     labelText: 'username',
                    //     focusedErrorBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(25.0),
                    //       borderSide: BorderSide(
                    //         color: const Color.fromARGB(255, 199, 40, 40),
                    //         width: 1.0,),),
                    //     errorBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(25.0),
                    //       borderSide: BorderSide(
                    //         color: const Color.fromARGB(255, 199, 40, 40),
                    //         width: 1.0,),),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(25.0),
                    //       borderSide: BorderSide(
                    //         color: Colors.black,
                    //         width: 1.0,
                    //       ),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(25.0),
                    //       borderSide: BorderSide(
                    //         color: Color.fromARGB(255, 255, 217, 0),
                    //       ),
                    //     ),
                    //     labelStyle: TextStyle(
                    //         color: const Color.fromARGB(255, 0, 0, 0)
                    //             .withOpacity(0.4)),
                    //     filled: true,
                    //     floatingLabelBehavior: FloatingLabelBehavior.auto,
                    //     fillColor: Colors.white.withOpacity(0.3),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // ),

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
                    Row(
                      children: [
                        Material(
                          child: Checkbox(
                            value: agreeTerms,
                            onChanged: (value) {
                              setState(() {
                                agreeTerms = value ?? false;
                              });
                            },
                          ),
                        ),
                        Flexible(
                          child: const Text(
                            'I have read and accept terms and conditions',
                          ),
                        )
                      ],
                    ),

                    //AddUser(_namecontroller.text, _usernamecontroller.text)
                    reButton('SigUp', true, () {
                      // checkSignup(context,_namecontroller, _emailcontroller.text, _usernamecontroller,_passwordcontroller.text, _confirmpasswordcontroller.text);
                      if (formkey.currentState!.validate()) {
                        signupUser(
                            context,
                            _namecontroller,
                            _emailcontroller,
                            _usernamecontroller,
                            _passwordcontroller,
                            dropdownvalue);
                      }
                      setState(() {});
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
}
