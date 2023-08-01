import 'package:flutter/material.dart';

import '../models/messages_model.dart';
import '../views/chats_screen.dart';
import 'chats.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 8.0,
                
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Active Users",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                        color: Colors.black54),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz,
                        size: 26, color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: favorites.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (favorites[index].active == true) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return ChatScreen(
                              user: favorites[index],
                            );
                          }));
                        },
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Stack(children: [
                                CircleAvatar(
                                  radius: 23,
                                  backgroundImage:
                                      AssetImage("${favorites[index].image}"),
                                ),
                                Container(
                                  margin:
                                      const EdgeInsets.only(top: 37, left: 10),
                                  child: CircleAvatar(
                                    radius: 8,
                                    backgroundColor:
                                        favorites[index].active == true
                                            ? Colors.green
                                            : Colors.yellow,
                                  ),
                                )
                                // Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(radius) ),)
                              ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "${favorites[index].name}",
                                style: const TextStyle(
                                  color: Colors.black38,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return null;
                  }),
            ),
            const Chats(),
          ],
        ),
      ),
    );
  }
}
