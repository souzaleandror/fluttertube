import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:fluttertube/blocs/favorite_bloc.dart';
import 'package:fluttertube/models/video.dart';
import 'package:fluttertube/screens/api.dart';

class VideoTile extends StatelessWidget {
  final Video video;

  VideoTile(this.video);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteBloc>(context);

    return GestureDetector(
      onTap: () {
        FlutterYoutube.playYoutubeVideoById(apiKey: API_KEY, videoId: video.id);
      },
      child: Container(
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
                  StreamBuilder<Map<String, Video>>(
                    stream: bloc.outFav,
                    builder: (context, snapshot) {
                      if (snapshot.hasData)
                        return IconButton(
                          icon: Icon(snapshot.data.containsKey(video.id)
                              ? Icons.star
                              : Icons.star_border),
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: () {
                            bloc.toggleFavorite(video);
                          },
                        );
                      else
                        return CircularProgressIndicator();
                    },
                  )
                ],
              )
            ]),
      ),
    );
  }
}
