import 'package:contact_manager2/Controller/home_screen_controller.dart';
import 'package:contact_manager2/Utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContactsScreen extends StatefulWidget {
  ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  String _currentDateTime = "Press the button to show date and time";

  void _updateDateTime() {
    DateTime now = DateTime.now();

    String formattedDate = DateFormat('MMMM d').format(now);

    String formattedTime = DateFormat('hh:mm a').format(now);

    setState(() {
      _currentDateTime = "$formattedDate at $formattedTime";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primarybg,
      appBar: AppBar(
        backgroundColor: ColorConstants.primarybg,
        actions: [
          IconButton(
              onPressed: () {
                HomeScreenController.listTables();
              },
              icon: Icon(Icons.edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "+91 6235646792",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20),
                  ),
                  Spacer(),
                  CircleAvatar(
                    radius: 23,
                    backgroundColor: Colors.greenAccent.shade700,
                    child: Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                     
                    },
                    child: CircleAvatar(
                      radius: 23,
                      backgroundColor: Colors.orange.shade400,
                      child: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.centerLeft, child: Text("Call History"))
            ],
          ),
        ),
      ),
    );
  }
}
