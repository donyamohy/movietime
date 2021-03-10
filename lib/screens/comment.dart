import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  static const routecomment = '/comment';
  @override
  _CommentState createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<String> _comments = [];
  void _addcomment(String c) {
    setState(() {
      _comments.add(c);
    });
  }

  Widget _buildCommentItem(String comment) {
    return ListTile(
      title: Text(comment),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add your comment")),
        body: Column(children: [
          Expanded(
              child: SizedBox(
                  height: 20,
                  child: ListView.builder(
                      itemCount: _comments.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return _buildCommentItem(_comments[index]);
                      }))),
          Container(
            width: (MediaQuery.of(context).size.width -
                    MediaQuery.of(context).padding.left) *
                0.95,
            height: (MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top) *
                0.08,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 7,
                      offset: Offset(0, 2))
                ]),
            child: TextField(
                onSubmitted: (String submittedStr) {
                  _addcomment(submittedStr);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(12),
                  prefixIcon: Icon(Icons.message_outlined),
                )),
          ),
        ]));
  }
}
