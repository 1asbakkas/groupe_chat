import 'package:flutter/material.dart';
import 'package:ntriniw__app/Model/chatmodel.dart';
import 'package:ntriniw__app/pages/chat.dart';

class HomnePage extends StatefulWidget {
  const HomnePage({super.key});

  @override
  State<HomnePage> createState() => _HomnePageState();
}

class _HomnePageState extends State<HomnePage> {
  List<Chatmodel> chats = [
    Chatmodel(
      name: "Goupe 1",
      isgroupe: false,
      currentMessage: "hi every one",
      time: "4:00",
       icon: 'person.svg'
    ),
    Chatmodel(
      name: "Goupe 2",
      isgroupe: false,
      currentMessage: "hi every one",
      time: "10:00",
       icon: 'person.svg'
    ),
    Chatmodel(
      name: "Goupe 3",
      isgroupe: true,
      currentMessage: "hi every one",
      time: "6:00",
       icon: 'person.svg'
    ),
    Chatmodel(
      name: "Goupe 4",
      isgroupe: false,
      currentMessage: "hi every one",
      time: "5:00",
       icon: 'goups.svg'
    ),
    Chatmodel(
      name: "Goupe 5",
      isgroupe: true,
      currentMessage: "hi every one",
      time: "2:00",
       icon: 'goups.svg'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groupe chat"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context,index)=> chat(
          chatmodel: chats[index]),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
        onPressed: () {
          openDialog();
        },
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("name the team"),
          content: TextField(
            autofocus: true,
            decoration: InputDecoration(hintText: "tape the goupe name"),
          ),
          actions: [
            TextButton(
              child: Text("submit"),
              onPressed: submit,
            ),
          ],
        ),
      );

  void submit() {
    Navigator.of(context).pop();
  }
}
