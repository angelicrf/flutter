import 'package:chatUI/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message_model.dart';

class ChatScreen  extends StatefulWidget {

  final User user;
  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}
class _ChatScreenState extends State<ChatScreen> {

  _buildMessage (Message message, bool isMe) {

    final Container msg = Container(
      margin: isMe ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0) :
      EdgeInsets.only(top: 8.0, bottom: 8.0,),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
          color: isMe ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: isMe ? BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomLeft: Radius.circular(20.0)
          ) : BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.time, style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),),
          SizedBox(height: 8.0,),
         Text(message.text),
        ],
      ),
    );

    if(isMe) {
      return msg;
    }
     return Row(
       children: [
        msg,
         IconButton(
           icon: message.isLiked ? Icon(Icons.favorite) :Icon(Icons.favorite_border),
           iconSize: 30.0,
           color: message.isLiked ? Colors.red : Colors.blueGrey,
           onPressed: () {},
         )
       ],
     );
  }
  _buildMessageComposer(){

    final _controller = TextEditingController();
    User getMessage;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0,),
      height: 70.0,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {},
            iconSize: 30.0,
          ),
          Expanded(
            child: Column(
              children: [
              SizedBox(
              height: 30,
                child:
                ListView.builder(
                    //shrinkWrap: true,
                    padding: EdgeInsets.only(top: 5.0, bottom: 30.0),
                    itemCount: chatsList.length,
                    itemBuilder: (BuildContext context, int index){
                      final Message message = chatsList[index];
                      getMessage = message.sender;
                      return new TextField(
                        textCapitalization: TextCapitalization.sentences,
                        decoration: InputDecoration.collapsed(hintText: "Send a message ...."),
                        controller: _controller,
                        onSubmitted: (value) =>{

                        }
                      );
                    }),
              )
              ],
            ),),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              setState(() =>
              {
                chatsList.add(Message(
                  sender: getMessage,
                  time: new DateTime.now().toString(),
                  text: _controller.text,
                  isLiked: true,
                  unread: true,
                ))
              });
              var i;
              for(i in chatsList) {
                print(i.text);
              }
                bool isMe = i.sender.id == i.sender.id;

              _buildMessage(i, isMe);
            },
            iconSize: 30.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text(widget.user.name, style: TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
    ),),
    elevation: 0.0,
    actions: [
      IconButton(
        icon: Icon(Icons.more_horiz),
        iconSize: 30.0,
        color: Colors.white,
        onPressed: () {},
      )
    ],),
      body:
          GestureDetector(
            onTap: () => {
              FocusScope.of(context).unfocus()
            },
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0),
                      )
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                        ),
                      child: ListView.builder(
                          padding: EdgeInsets.only(top: 15.0),
                          itemCount: chatsList.length,
                          itemBuilder: (BuildContext context, int index){
                            final Message message = chatsList[index];
                            bool isMe = message.sender.id == message.sender.id;
                        return _buildMessage(message, isMe);
                      }),
                    ),
                  )
                ),
                _buildMessageComposer()
             ]
            ),
          ),
    );
  }
}

