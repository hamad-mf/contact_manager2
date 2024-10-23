import 'dart:io';

import 'package:contact_manager2/Controller/home_screen_controller.dart';
import 'package:contact_manager2/Utils/color_constants.dart';
import 'package:contact_manager2/Utils/image_constants.dart';
import 'package:contact_manager2/View/Add_Contacts/add_contacts.dart';
import 'package:contact_manager2/View/Calling%20Screen/calling_screen.dart';
import 'package:contact_manager2/View/Contacts%20Screen/contacts_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await HomeScreenController.getAllContacts();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.primarybg,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddContacts()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: ColorConstants.primarybg,
        actions: [
          Row(
            children: [
              Icon(
                Icons.search,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.more_vert),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomeScreenController.contactsList.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Image.asset(ImageConstants.homepage),
                      Text("You have no contacts yet")
                    ],
                  ),
                )
              : Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ContactsScreen()));
                    },
                    child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) =>
                            ListTile(
                              leading: CircleAvatar(
                                backgroundImage: HomeScreenController
                                            .contactsList[index]["imagepath"] !=
                                        null
                                    ? FileImage(File(HomeScreenController
                                        .contactsList[index]["imagepath"]!))
                                    : null,
                                child: HomeScreenController.contactsList[index]
                                            ["imagepath"] ==
                                        null
                                    ? Icon(Icons.person, size: 50)
                                    : null,
                              ),
                              title: Text(HomeScreenController
                                  .contactsList[index]["name"]),
                              subtitle: Text(HomeScreenController
                                  .contactsList[index]["phone"]
                                  .toString()),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    CallingScreen()));
                                      },
                                      icon: Icon(Icons.call)),
                                  IconButton(
                                      onPressed: () async {
                                        print(_currentDateTime);
                                        await HomeScreenController
                                            .removeContact(HomeScreenController
                                                .contactsList[index]["id"]);
                                        setState(() {});
                                      },
                                      icon: Icon(Icons.delete))
                                ],
                              ),
                            ),
                        separatorBuilder: (BuildContext context, int index) =>
                            Divider(),
                        itemCount: HomeScreenController.contactsList.length),
                  ),
                )
        ],
      ),
    );
  }
}
