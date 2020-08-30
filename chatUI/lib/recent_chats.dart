import 'package:chatUI/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'message_model.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))
          ),
          child: ListView.builder(
              itemCount: chatsList.length,
              itemBuilder: (BuildContext context, int index){
                final Message chat = chatsList[index];
                return GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) =>
                      ChatScreen(user: chat.sender))),
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(color: chat.unread? Color(0xFFFFEFEE) : Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)
                    )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: <Widget>[
                            //CircleAvatar(radius: 25.0, backgroundImage: AssetImage(chat.sender.imageUrl),),
                            Align(
                              child: ClipOval(
                                child: SizedBox(
                                    width: 60.0,
                                    height: 60.0,
                                    child:
                                    Image.file(chat.sender.imageUrl,fit: BoxFit.fill,)
                                ),
                              ),
                            ),
                            SizedBox(width: 10.0,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 5.0,),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.40,
                                  child: Text(chat.sender.name,style: TextStyle(
                                      color: Colors.blueGrey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600
                                  ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(chat.text)
                              ],
                            ),
                          ],
                        ),
                        Column(children: [
                          Text(chat.time, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey
                          ),),
                          SizedBox(height: 5.0,),
                          chat.unread ? Container(
                            width: 40.0,
                              height: 20.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Theme.of(context).primaryColor,
                              ),
                              alignment: Alignment.center,
                              child: Text("NEW", style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),)) : Text("")
                        ],)
                      ],
                    ),
                  ),
                ) ;
              }),
        ));
  }
}
