import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(237, 237, 237, 0.9),
        child: Column(
          children: <Widget>[
            Container(
              height: 32,
              margin: EdgeInsets.only(top: 20),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(
                      Icons.search,
                      size: 20,
                    ),
                    width: 35,
                    padding: EdgeInsets.all(5),
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.white,
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                        )),
                  ),
                  Container(
                    color: Color.fromRGBO(237, 237, 237, 0.9),
                    height: 32,
                    width: 60,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "取消",
                          style: TextStyle(color: Colors.blue),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
