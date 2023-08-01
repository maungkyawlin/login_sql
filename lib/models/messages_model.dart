

import 'package:new_flutter_app/models/users_model.dart';

class Message {
  final User? sender;
  final String? time;
  final String? text;
  final bool? isLiked;
  final bool? unRead;

  Message({
    this.sender,
    this.time,
    this.text,
    this.isLiked,
    this.unRead,
  });
}

//fade data for Users
final User currentUser = User(
  id: 0,
  name: "Current User",
  image: "assets/images/6.jpg",
  active: false,
  friend: false,
);
final User john = User(
  id: 1,
  name: "John Josh",
  image: "assets/images/7.jpg",
  active: true,
  friend: false
);
final User make = User(
  id: 2,
  name: "Make Son",
  image: "assets/images/8.jpg",
  active: true,
  friend: false
);
final User saira = User(
  id: 3,
  name: "Saira Smite",
  image: "assets/images/bicycle.jpg",
  active: true,
  friend: true
);
final User sweet = User(
  id: 4,
  name: "Sweet Smile",
  image: "assets/images/bridge.jpg",
  active: true,
  friend: true
);
final User rock = User(
  id: 5,
  name: "Rock Reck",
  image: "assets/images/view1.jpg",
  active: false,
  friend: true
);
final User nike = User(
  id: 6,
  name: "Nike Name",
  image: "assets/images/view2.jpg",
  active: true,
  friend: false
);
final User tellar = User(
  id: 7,
  name: "Tellar Trank",
  image: "assets/images/td.jpg",
  active: false,
  friend: true
);

//List type for users
List<User> favorites = [saira, sweet, john, make, tellar, rock, nike];

//messages from users
List<Message> chats = [
  Message(
    sender: saira,
    time: "03:21 PM",
    text: "Hi, how's it going? What did you do today?",
    isLiked: true,
    unRead: false,
    
  ),
  Message(
    sender: sweet,
    time: "01:21 PM",
    text: "Hi, how's it going? What did you do today?",
    isLiked: true,
    unRead: true,
  ),
  Message(
    sender: john,
    time: "08:01 AM",
    text: "Hi, how's it going? What did you do today?",
    isLiked: true,
    unRead: true,
  ),
  Message(
    sender: make,
    time: "12:10 PM",
    text: "Hi, how's it going? What did you do today?",
    isLiked: true,
    unRead: false,
  ),
  Message(
    sender: tellar,
    time: "04:21 PM",
    text: "Hey ,Good Evening.",
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: nike,
    time: "09:21 PM",
    text: "Hi, Good Night! Sleep well, Sweet dream!",
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: rock,
    time: "06:00 AM",
    text: "Hi, Good Morning! How are you?",
    isLiked: false,
    unRead: true,
  ),
];
//chatting message
List<Message> messages = [
  Message(
    sender: saira,
    time: "3:20 PM",
    text:
        "Hey, how's it going? what did you do today dfdsf dfsdf ddfds fdfdfdssasdssdffgdfsg ?",
    isLiked: true,
    unRead: true,
  ),
  Message(
    sender: currentUser,
    time: "3:20 PM",
    text:
        "Just walk my doge. She was superduper Cute.The best pupper hello hin f dfsd;",
    isLiked: true,
    unRead: true,
  ),
  Message(
    sender: saira,
    time: "3:20 PM",
    text: "How's the doggo",
    isLiked: true,
    unRead: true,
  ),
  Message(
    sender: saira,
    time: "3:20 PM",
    text: "All the foods",
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: saira,
    time: "3:20 PM",
    text: "How's the doggo",
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: saira,
    time: "3:20 PM",
    text: "All the foods",
    isLiked: true,
    unRead: true,
  ),
  Message(
    sender: currentUser,
    time: "2:20 PM",
    text: "Nice! what kind of food did you eat?",
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: currentUser,
    time: "2:20 PM",
    text: "Nice! This kind of food ",
    isLiked: false,
    unRead: true,
  ),
  Message(
    sender: saira,
    time: "2:20 PM",
    text: "I ate so much food today",
    isLiked: false,
    unRead: true,
  ),
];
