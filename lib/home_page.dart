import 'package:flutter/material.dart';
import 'package:flutter_login/chat.dart';
import 'package:flutter_login/conversation.dart';
import 'package:flutter_login/user_page.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Chats",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_work),
            label: "Channels",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: "Profile",
          ),
        ],
      ),
      body: content(),
    );
  }

  Widget content() {
    List<ChatUsers> chatUsers = [
      ChatUsers(
          name: "Jane Russel",
          messageText: "Awesome Setup",
          imageURL: "assets/images/1.jpg",
          time: "Now"),
      ChatUsers(
          name: "Adam Yau",
          messageText: "Welcome !",
          imageURL: "assets/images/2.jpg",
          time: "Yesterday"),
      ChatUsers(
          name: "TK",
          messageText: "All the best",
          imageURL: "assets/images/3.jpg",
          time: "31 Jun"),
      ChatUsers(
          name: "Philip Yap",
          messageText: "Let's catch up soon",
          imageURL: "assets/images/4.jpg",
          time: "29 August"),
      ChatUsers(
          name: "Dora",
          messageText: "How are you?",
          imageURL: "assets/images/5.jpg",
          time: "20 Dec"),
      ChatUsers(
          name: "John Jane",
          messageText: "Thank you, It's awesome",
          imageURL: "assets/images/6.jpg",
          time: "1 Dec"),
      ChatUsers(
          name: "Jane Russel",
          messageText: "Awesome Setup",
          imageURL: "assets/images/7.jpg",
          time: "Now"),
      ChatUsers(
          name: "Adam Yau",
          messageText: "Welcome !",
          imageURL: "assets/images/9.jpg",
          time: "Yesterday"),
      ChatUsers(
          name: "Dora",
          messageText: "How are you?",
          imageURL: "assets/images/10.jpg",
          time: "20 Dec"),
    ];
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    height: 27,
                    decoration: BoxDecoration(
                      color: Colors.pink[50],
                      borderRadius: BorderRadius.circular(29),
                    ),
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 2),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.add,
                          color: Colors.pinkAccent,
                          size: 20,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "Add New",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search....",
                hintStyle: TextStyle(color: Colors.grey.shade600),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade600,
                  size: 20,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.all(8),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.grey.shade100)),
              ),
            ),
          ),
          ListView.builder(
            itemCount: chatUsers.length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(top: 16),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: ((context, index) {
              return GestureDetector(
                onTap: (() => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Chat(),
                      ),
                    )),
                child: ConversationList(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    imageURL: chatUsers[index].imageURL,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3) ? true : false),
              );
            }),
          ),
        ],
      ),
    );
  }
}
