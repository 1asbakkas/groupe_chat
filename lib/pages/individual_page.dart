import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ntriniw__app/Model/chatmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({super.key, required this.chatmodel});
  final Chatmodel chatmodel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 236, 232),
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leadingWidth: 70,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back,
                size: 24,
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 137, 218, 168),
                child: SvgPicture.asset(
                    widget.chatmodel.isgroupe
                        ? "assets/goups.svg"
                        : "assets/person.svg",
                    width: 37,
                    height: 37),
              ),
            ],
          ),
        ),
        title: InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.chatmodel.name,
                  style: TextStyle(fontSize: 18.5, fontWeight: FontWeight.bold),
                ),
                Text(
                  "last seen at 19:00",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                )
              ],
            ),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.videocam)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(
                  child: Text("view contact"),
                  value: "view contact",
                ),
                PopupMenuItem(
                  child: Text("Media,Links and docs"),
                  value: "Media,Links and docs",
                ),
                PopupMenuItem(
                  child: Text("Flutter Web"),
                  value: "Flutter Web",
                ),
                PopupMenuItem(
                  child: Text("Search"),
                  value: "Search",
                ),
                PopupMenuItem(
                  child: Text("Mute Notification"),
                  value: "Mute Notification",
                ),
              ];
            },
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            ListView(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width - 55,
                          child: Card(
                              margin:
                                  EdgeInsets.only(right: 2, left: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: ("type ur message"),
                                    contentPadding: EdgeInsets.all(8),
                                    prefixIcon: IconButton(
                                      icon: Icon(Icons.emoji_emotions),
                                      onPressed: () {
                                        setState(() {
                                          show = !show;
                                        });
                                      },
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.attach_file)),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.camera_alt))
                                      ],
                                    )),
                              ))),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: CircleAvatar(
                          backgroundColor: Colors.yellow,
                          radius: 25,
                          child: IconButton(
                            icon: Icon(Icons.mic),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                  show ? emojiselect() : Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget emojiselect() {
    return EmojiPicker(
      
      onEmojiSelected: (emoji, Category) {
      print(emoji);
    });
  }
}
