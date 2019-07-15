import 'package:flutter/material.dart';
import 'package:fluttertube/models/video.dart';

class VideoTile extends StatelessWidget {
  final Video video;

  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Image.network(video.thumb, fit: BoxFit.cover),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text(video.title,
                            maxLines: 2,
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Text(video.channel,
                            maxLines: 2,
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.star_border),
                  iconSize: 30,
                  onPressed: () {},
                )
              ],
            )
          ]),
    );
  }
}
