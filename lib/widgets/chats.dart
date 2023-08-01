
import 'package:flutter/material.dart';
import 'package:new_flutter_app/views/chats_screen.dart';

import '../models/messages_model.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: ClipRRect(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(0),
                padding: const EdgeInsets.all(0),
                height: 430,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: chats.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return ChatScreen(
                              user: chats[index].sender,
                            );
                          }));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                                top: 6,
                                bottom: 6,
                              ),
                              padding: const EdgeInsets.only(
                                left: 5,
                                right: 5,
                              ),
                              decoration: BoxDecoration(
                                  color: chats[index].unRead == true
                                      ? Colors.purpleAccent.withOpacity(0.4)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                  ),
                              child: Row(
                                children: [
                                  Row(
                                    children: [
                                      Stack(children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundImage: AssetImage(
                                              "${chats[index].sender?.image}"),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                            top: 40,
                                            left: 30,
                                          ),
                                          child: CircleAvatar(
                                            radius: 8,
                                            backgroundColor:
                                                chats[index].sender?.active ==
                                                        true
                                                    ? Colors.green
                                                    : Colors.yellow,
                                          ),
                                        ),
                                      ]),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 240,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text("${chats[index].sender?.name}",
                                                style:  TextStyle(
                                                  color: chats[index].unRead==true ? Colors.black54:Colors.black38,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                )),
                                            Text(
                                              "${chats[index].text}",
                                              style:  TextStyle(
                                                color: chats[index].unRead==true ? Colors.white:Colors.purpleAccent.withOpacity(0.7),
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "${chats[index].time}",
                                        style: const TextStyle(
                                          color: Colors.black45,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (chats[index].unRead == true)
                                        Container(
                                          width: 50,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Center(
                                            child: Text(
                                              "New",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Center(
                                child: IconButton(
                                    hoverColor: Colors.white,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_vert,
                                      color: Colors.black26,
                                    )),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
