import 'package:flutter/material.dart';

class CallingScreen extends StatelessWidget {
  const CallingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black,
      body: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: const Column(
                children: [
                  Text(
                    "1:43",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Text(
                    "+91 6235646792",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Center(
                  child: Column(
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Dulquer_Salmaan_at_Karwaan_promotions_%28cropped%29.jpg/330px-Dulquer_Salmaan_at_Karwaan_promotions_%28cropped%29.jpg'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Dulqar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "IDENTIFIED BY TRUECALLER ",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                    ),
                    child: const Text(
                      "iNDIA, KERALA",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )),
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Mute"),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.mic_external_off_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      "Mute",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 90,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.dialpad_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text("Keypad", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.speaker,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text("Speaker", style: TextStyle(color: Colors.white))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Mute"),
                SizedBox(
                  width: 18,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.add_call,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text(
                      "Add Call",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  width: 80,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text("Keypad", style: TextStyle(color: Colors.white)),
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.message_rounded,
                      color: Colors.white,
                      size: 40,
                    ),
                    Text("Speaker", style: TextStyle(color: Colors.white))
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Mute"),
                SizedBox(
                  width: 17,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.stop_circle_sharp,
                      color: Colors.red,
                      size: 60,
                    ),
                  ],
                ),
                SizedBox(
                  width: 72,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.call_end_rounded,
                      color: Colors.red,
                      size: 60,
                    ),
                  ],
                ),
                SizedBox(
                  width: 90,
                ),
                Column(
                  children: [
                    Icon(
                      Icons.video_call,
                      color: Colors.red,
                      size: 60,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
    );
  }
}