import 'package:faceBookUI/user_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models/user_model.dart';

class ContactsList extends StatelessWidget {
  final List<User> users;

  const ContactsList({Key key, @required this.users}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints(maxHeight: 290.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  "Contacts",
                  style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]),
                ),
              ),
              Icon(
                Icons.search,
                size: 30.0,
                color: Colors.grey,
              ),
              SizedBox(
                width: 5.0,
              ),
              Icon(
                Icons.more_horiz,
                size: 30.0,
                color: Colors.grey,
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 11.0),
              itemCount: users.length,
              itemBuilder: (BuildContext context, int index) {
                final User user = users[index];
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: UserCard(user: user),
                  ),
                );
              }),
        )
      ],
    );
  }
}
