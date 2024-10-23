import 'dart:io';


import 'package:contact_manager2/Controller/home_screen_controller.dart';
import 'package:contact_manager2/Utils/color_constants.dart';
import 'package:contact_manager2/View/Home%20Screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddContacts extends StatefulWidget {
  const AddContacts({super.key});

  @override
  State<AddContacts> createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
   String? imagepath;
  @override
  Widget build(BuildContext context) {
   

    TextEditingController _mobilenocontroller = TextEditingController();
    TextEditingController _namecontroller = TextEditingController();
    final _mobilenumKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: ColorConstants.primarybg,
      appBar: AppBar(
        backgroundColor: ColorConstants.primarybg,
        title: Text(
          "Add",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                bool isMobilenumberValid =
                    _mobilenumKey.currentState!.validate();
                if (isMobilenumberValid) {
                  await HomeScreenController.addContact(

                      _namecontroller.text, _mobilenocontroller.text,imagepath);
                  setState(() {});
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                      (Route route) => false);
                }
              },
              icon: Icon(Icons.save_as))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Stack(children: [
             CircleAvatar(
  radius: 100, 
  backgroundImage: imagepath != null ? FileImage(File(imagepath!)) : null,
  child: imagepath == null
      ? Icon(Icons.person, size: 50) 
      : null,
),
              Positioned(
                  right: 20,
                  bottom: 10,
                  child: InkWell(
                    onTap: () async {
                  final ImagePicker picker = ImagePicker();
                  final XFile? upimage =
                      await picker.pickImage(source: ImageSource.gallery);
                  if (upimage != null) {
                    
                    imagepath = upimage.path;
                  }
                  setState(() {
                    
                  });
                },
                    child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        )),
                  )),
            ]),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _namecontroller,
              decoration: InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                // floatingLabelBehavior: FloatingLabelBehavior
                //     .always,
                hintText: "Enter Name",

                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _mobilenumKey,
              child: TextFormField(
                controller: _mobilenocontroller,
                decoration: InputDecoration(
                  labelText: "Mobile Number",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ), // Set the label text
                  floatingLabelBehavior: FloatingLabelBehavior
                      .always, // Ensure label is always visible
                  hintText: "10 digit mobile number",
                  prefix: Text(
                    "+91  |  ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (_mobilenocontroller.text.isEmpty ||
                      _mobilenocontroller.text.length < 10) {
                    return "Enter a valid mobile number";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}
