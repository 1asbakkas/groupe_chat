import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ntriniw__app/Model/chatmodel.dart';
import 'package:ntriniw__app/pages/individual_page.dart';

// ignore: camel_case_types
class chat extends StatelessWidget {
  const chat({super.key,required this.chatmodel});
  final Chatmodel chatmodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> IndividualPage(chatmodel: chatmodel)));
      },
      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                child:
                    SvgPicture.asset(chatmodel.isgroupe? "assets/goups.svg":"assets/person.svg", width: 37, height: 37),
                radius: 25,
              ),
              trailing: Text(chatmodel.time),
              title: Text(
                chatmodel.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.done_all),
                  SizedBox(
                    width: 13,
                  ),
                  Text(
                    chatmodel.currentMessage,
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1,
            ),
          )
        ],
      ),
    );
  }
}
