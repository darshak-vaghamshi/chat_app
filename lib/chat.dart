import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_login/send_menu_items.dart';

import 'user_page.dart';

class Chat extends StatelessWidget {
  Chat({super.key});
  List<ChatMessage> message = [
    ChatMessage(messageContent: "Hello, Jane", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(
        messageContent: "Hey vin, I am doing fine dude, How bout you ?",
        messageType: "sender"),
    ChatMessage(
        messageContent: "Great to hear that ! I am doing good too",
        messageType: "receiver"),
    ChatMessage(
        messageContent: "Let's have a meetup soon !", messageType: "sender"),
  ];
  List<SendMenuItems> menuItems = [
    SendMenuItems(
        text: "Photos & Videos",
        icons: Icons.image_outlined,
        color: Colors.blue),
    SendMenuItems(
        text: "Document",
        icons: Icons.insert_drive_file_rounded,
        color: Colors.purple),
    SendMenuItems(
        text: "Audio", icons: Icons.audiotrack, color: Colors.blueGrey),
    SendMenuItems(
        text: "Location", icons: Icons.location_pin, color: Colors.deepPurple),
    SendMenuItems(
        text: "Contact", icons: Icons.person_2_rounded, color: Colors.purple),
  ];
  void showModal(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 40,
                    color: Colors.grey,
                  ),
                ),
                ListView.builder(
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: ListTile(
                        leading: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(29),
                            color: menuItems[index].color.shade100,
                          ),
                          height: 40,
                          width: 40,
                          child: Icon(
                            menuItems[index].icons,
                            size: 20,
                            color: menuItems[index].color.shade400,
                          ),
                        ),
                        title: Text(menuItems[index].text),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/1.jpg"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Jane Russel",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                ),
                Icon(
                  Icons.settings,
                  color: Colors.black54,
                )
              ],
            ),
          ),
        ),
      ),
      body: content(message, context),
    );
  }

  Widget content(List<ChatMessage> message, context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: message.length,
          itemBuilder: ((context, index) {
            return Container(
              padding:
                  EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
              child: Align(
                alignment: message[index].messageType == "receiver"
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (message[index].messageType == "recevier")
                          ? Colors.grey.shade200
                          : Colors.blue[200]),
                  padding: EdgeInsets.all(16),
                  child: Text(
                    message[index].messageContent,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            );
          }),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            height: 80,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showModal(context);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.blue[400],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Write message....",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  padding: EdgeInsets.only(right: 20, bottom: 10),
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue[400],
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
