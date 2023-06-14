import 'package:flutter/material.dart';
import 'package:whatsappclone/models/chatmodel.dart';
import 'package:whatsappclone/models/single_chat_model.dart';
import 'package:whatsappclone/pages/chatbubble.dart';
import 'package:whatsappclone/widgets/utility_widget.dart';

class chatDetails extends StatefulWidget {
  chatDetails({super.key, required this.chatdata});
  Chat chatdata;

  @override
  State<chatDetails> createState() => _chatDetailsState();
}

class _chatDetailsState extends State<chatDetails> {
  List<SingleChat> messages=[
    SingleChat(isSend: true, isReaded: true, message: "Hello", sendAt: "9:00 am"),
    SingleChat(isSend: true, isReaded: false, message: "Heyyy", sendAt: "10:00 am"),
    SingleChat(isSend: false, isReaded: false, message: "Gm", sendAt: "10:10 am"),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leadingWidth: 80,
        leading: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back),
            ),
            CircleAvatar(
              backgroundImage: (widget.chatdata.avatar == "")
                  ? NetworkImage((widget.chatdata.isGroup!)
                      ? "data:image/png;base64,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"
                      : "data:image/png;base64,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")
                  : NetworkImage(widget.chatdata.avatar!),
            ),
          ],
        ),
        title: Column(
          children: [
            Text(
              widget.chatdata.name!,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              widget.chatdata.status!,
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
          UtilityWidget().widthSpacer(10),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          UtilityWidget().widthSpacer(10),
          PopupMenuButton(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: 1, child: Text("View Contact")),
                PopupMenuItem(value: 2, child: Text("Media")),
                PopupMenuItem(value: 3, child: Text("Search")),
                PopupMenuItem(value: 4, child: Text("Mute notifications")),
                PopupMenuItem(value: 5, child: Text("Walpaper")),
                PopupMenuItem(value: 6, child: Text("More")),
              ];
            },
          ),
          UtilityWidget().widthSpacer(10),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
                "data:image/jpeg;base64,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",
                fit: BoxFit.cover,),
          ),
          ListView.builder(
            itemCount: messages.length,
            itemBuilder:(context, index) {
              return ChatBubble(message: messages[index]);
            }, ),
            Align(alignment: Alignment.bottomCenter,
              child: Column(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width -70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: TextField(
                          cursorColor: Colors.teal,
                          style: TextStyle(
                            fontSize: 20
                          ),
                          decoration: InputDecoration(
                            prefix: IconButton(onPressed: () {
                              
                            }, icon: Icon(Icons.emoji_emotions_outlined)),
                            hintText: "Type a Message",
                            suffixIcon: Row( mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(onPressed: () {
                                  
                                }, icon: Icon(Icons.attach_file)),
                                IconButton(onPressed: () {
                                  
                                }, icon: Icon(Icons.currency_rupee)),
                                IconButton(onPressed: () {
                                  
                                }, icon: Icon(Icons.camera_alt)),
                              ],
                            )
                          ),
                        )),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
