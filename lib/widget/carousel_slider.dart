import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mins_app/model/movie.dart';
import 'package:mins_app/screen/detail_screen.dart';

class CarouselImage extends StatefulWidget {
  final List<Movie> movies;
  CarouselImage({this.movies});

  _CarouselImageState createState() => _CarouselImageState();
}

class _CarouselImageState extends State<CarouselImage> {

  List<Movie> movies;
  List<Widget> images;
  List<String> keywords;
  List<bool> likes;
  int currentPage = 0;
  String currentKeyword;


  @override
  void initState() {
    super.initState();
    movies = widget.movies;
    images = movies.map((e) => Image.asset(e.poster)).toList();
    keywords = movies.map((e) => e.keyword).toList();
    likes = movies.map((e) => e.like).toList();

    currentKeyword = keywords[0];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
          ), //

          CarouselSlider(
            items: images,
            options: CarouselOptions(
              onPageChanged: (index, temp) {
                setState(() {
                  currentPage = index;
                  currentKeyword = keywords[index];
                });
              }
            ),
          ), // carousel

          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 3),
            child: Text(currentKeyword, style: TextStyle(fontSize: 11),),
          ), // margin

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(child: Column(children: <Widget>[
                  likes[currentPage]
                      ? IconButton(icon: Icon(Icons.check), onPressed: () {},)
                      : IconButton(icon: Icon(Icons.add), onPressed: () {},),

                  Text('내가 찜한 콘텐츠', style: TextStyle(fontSize: 11),)
                ],),),

                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: FlatButton(
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.play_arrow, color: Colors.black,),
                        Padding(padding: EdgeInsets.all(3),),
                        Text('재생', style: TextStyle(color: Colors.black),)
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.info),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute<Null>(
                            fullscreenDialog: true,
                            builder: (BuildContext context) {
                              return DetailScreen(
                                movie: movies[currentPage],
                              );
                            }
                          ));
                        },
                      ),
                      Text(
                        '정보',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                )
              ],
            ),
          ), // operation buttons

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: makeIndicator(movies, currentPage),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> makeIndicator(List list, int currentPage) {
  List<Widget> results = [];

  for(var i = 0; i < list.length; i++) {
    results.add(
      Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: currentPage == i ? Colors.white : Colors.grey,
        ),
      )
    );
  }

  return results;
}