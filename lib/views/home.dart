import 'package:flutter/material.dart';
import 'package:new_flutter_app/widgets/favorites.dart';

import '../models/messages_model.dart';
import '../views/chats_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          toolbarHeight: 70,
          //backgroundColor: Colors.black54,
          leadingWidth: 40,
          titleSpacing: 0.8,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              size: 30,
            ),
          ),
          title: const Text(
            "Chats",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0.0,
          actions: [
            TextButton(
              onPressed: () {},
              child: Stack(children: [
                Container(
                  margin: const EdgeInsets.only(top: 5, right: 10),
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage("${messages[1].sender?.image}"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 35,
                  ),
                  child: const CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.green,
                  ),
                )
                // Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(radius) ),)
              ]),
            ),

            // Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(radius) ),)
          ],
          //gradient colors for appbar
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                // gradient: LinearGradient(colors: [
                //   Colors.purple,
                //   Colors.blue,
                // ], begin: Alignment.bottomLeft, end: Alignment.bottomRight),
                ),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicator: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2.0, color: Colors.white)),
              //gradient: LinearGradient(colors: [Colors.blue, Colors.purple])
            ),
            indicatorWeight: 4,
            tabs: [
              Tab(icon: Icon(Icons.message), text: "Chats"),
              Tab(icon: Icon(Icons.people), text: "Friends"),
              Tab(icon: Icon(Icons.group_add_rounded), text: "Group"),
              Tab(icon: Icon(Icons.person_add_alt), text: "Requests"),
            ],
          ),
        ),
        body: TabBarView(children: [
          messagePage(),
          friendsPage(),
          groupPage(),
          requestPage(),
        ]),
      ),
    );
  }
}

requestPage() {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextField(
            textCapitalization: TextCapitalization.words,
            style: TextStyle(
                inherit: false,
                color: Colors.black26,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic),
            decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                icon: Icon(Icons.search),
                border: InputBorder.none),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
        child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (BuildContext context, int index) {
            if (favorites[index].friend == true) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ChatScreen(
                      user: favorites[index],
                    );
                  }));
                },
                child:  Card(
                    child: ListTile(
                     
                      
                      leading: Stack(children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("${favorites[index].image}"),
                            ),
                         
                          ]),
                          
                         title: Text(
                            "${favorites[index].name}",
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           trailing: ElevatedButton(onPressed: (){}, child: const Text("Confirm"))
                     
                    ),
                  ),
             
              );
            }else if(favorites[index].friend==false){
               return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ChatScreen(
                      user: favorites[index],
                    );
                  }));
                },
                child:  Card(
                    child: ListTile(
                     
                      
                      leading: Stack(children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("${favorites[index].image}"),
                            ),
                         
                          ]),
                          
                         title: Text(
                            "${favorites[index].name}",
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           trailing: ElevatedButton(
                          
                            onPressed: (){}, child: const Text("Request"))
                     
                    ),
                  ),
             
              );
            }
            return null;
           
          },
        ),
      ),
    ],
  );
}

groupPage() {
  return const Center(
    child: Text(
      "GroupPage",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    ),
  );
}

friendsPage() {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextField(
            textCapitalization: TextCapitalization.words,
            style: TextStyle(
                inherit: false,
                color: Colors.black26,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic),
            decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                icon: Icon(Icons.search),
                border: InputBorder.none),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Expanded(
        child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (BuildContext context, int index) {
            if (favorites[index].friend == true) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ChatScreen(
                      user: favorites[index],
                    );
                  }));
                },
                child:  Card(
                    child: ListTile(
                     
                      
                      leading: Stack(children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("${favorites[index].image}"),
                            ),
                         
                          ]),
                          
                         title: Text(
                            "${favorites[index].name}",
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           trailing: ElevatedButton(onPressed: (){}, child: const Text("Unfriend"))
                     
                    ),
                  ),
             
              );
            }else if(favorites[index].friend==false){
               return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return ChatScreen(
                      user: favorites[index],
                    );
                  }));
                },
                child:  Card(
                    child: ListTile(
                     
                      
                      leading: Stack(children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  AssetImage("${favorites[index].image}"),
                            ),
                         
                          ]),
                          
                         title: Text(
                            "${favorites[index].name}",
                            style: const TextStyle(
                              color: Colors.black38,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           trailing: ElevatedButton(onPressed: (){}, child: const Text("Add Friend"))
                     
                    ),
                  ),
             
              );
            }
            return null;
            
          },
        ),
      ),
    ],
  );
}

messagePage() {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: TextField(
            textCapitalization: TextCapitalization.words,
            style: TextStyle(
                inherit: false,
                color: Colors.black26,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textBaseline: TextBaseline.alphabetic),
            decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                icon: Icon(Icons.search),
                border: InputBorder.none),
          ),
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const Favorites(),
    ],
  );
}
