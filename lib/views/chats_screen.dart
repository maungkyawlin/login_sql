
import 'package:flutter/material.dart';


import '../models/messages_model.dart';
import '../models/users_model.dart';
import 'home.dart';

class ChatScreen extends StatefulWidget {
  final User? user;
  const ChatScreen({Key? key, this.user}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessageFields() {
    return Container(
        width: double.infinity,
        height: 65,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.gif,
                size: 35,
              ),
              color: Colors.purpleAccent,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.image,
                size: 25,
              ),
              color: Colors.purpleAccent,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
                size: 25,
              ),
              color: Colors.purpleAccent,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.mic,
                size: 25,
              ),
              color: Colors.purpleAccent,
            ),
            Expanded(
                child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: TextField(
                cursorColor: Colors.purpleAccent,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: InputBorder.none,
                  hintText: "Send Messages..",
                ),
              ),
            )),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.send,
                size: 25,
              ),
              color: Colors.purpleAccent,
            ),
          ],
        ));
  }

  _buildChatting(
    Message message,
    bool myChat,
  ) {
    return Row(
      mainAxisAlignment:
          myChat ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          myChat ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        myChat
            ? Container()
            : Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.only(
                      top: 52,
                      right: 10,
                    ),
                    child: CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage("${widget.user?.image}")),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 84, left: 25),
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: widget.user?.active == true
                          ? Colors.green
                          : Colors.yellow,
                    ),
                  ),
                ],
              ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(3),
            margin: myChat
                ? const EdgeInsets.only(
                    left: 55,
                    top: 10.0,
                    bottom: 10.0,
                  )
                : const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
            decoration: BoxDecoration(
              color: myChat ? Colors.white : Colors.purpleAccent.withOpacity(0.4),
              borderRadius: myChat
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(10))
                  : const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topLeft: Radius.circular(20)),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: myChat
                  ? const EdgeInsets.only(
                      right: 10,
                      left: 10,
                    )
                  : const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${message.text}",
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: myChat ? Colors.purpleAccent : Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "${message.time}",
                    style: TextStyle(
                      color: myChat ? Colors.purpleAccent : Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            // Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(radius) ),)
          ),
        ),
        myChat
            ? Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(0),
                    margin: const EdgeInsets.only(top: 50, left: 10),
                    child: CircleAvatar(
                        radius: 10,
                        backgroundImage: AssetImage("${widget.user?.image}")),
                  ),
                ],
              )
            : Container(
                margin: EdgeInsets.only(top: message.isLiked == true ? 60 : 30),
                child: Icon(
                  message.isLiked == true ? Icons.favorite : Icons.more_vert,
                  color: message.isLiked == true ? Colors.red : Colors.white54,
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        //backgroundColor: Colors.black,
        toolbarHeight: 80,
        titleSpacing: 0.8,
        leadingWidth: 120,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const HomePage();
                }));
              },
              icon:  CircleAvatar(
                child: Center(
                  child: Icon(
                    Icons.arrow_back,
                    size: 24,
                    color: Colors.deepPurple.withOpacity(0.5),
                   
                  ),
                ),
              ),
            ),
            Stack(children: [
              Container(
                margin: const EdgeInsets.only(top: 5, right: 10),
                child: CircleAvatar(
                  foregroundColor: Colors.white,
                  radius: 20,
                  backgroundImage: AssetImage("${widget.user?.image}"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  top: 34,
                  left: 28
                ),
                child: const CircleAvatar(
                  foregroundColor: Colors.white,
                  radius: 7,
                  backgroundColor: Colors.green,
                ),
              )
              // Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(radius) ),)
            ]),
          ],
        ),
        title: Text(
          "${widget.user?.name}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            
            // gradient: LinearGradient(colors: [
            //   Colors.purple,
            //   Colors.blue,
            // ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          ),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.phone),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.video_call),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.help),
          ),
        ],
      ),
      body: Column(
        children: [
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(20)),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final message = messages[index];
                      bool myChat =
                          messages[index].sender?.id == currentUser.id;

                      return _buildChatting(message, myChat);
                    }),
              ),
            ),
          ),
          _buildMessageFields(),
        ],
      ),
    );
  }
}
