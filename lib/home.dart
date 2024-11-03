import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/widgets/toprated.dart';
import 'package:movieapp/widgets/tv.dart';
import 'package:movieapp/widgets/upcomming.dart';
import 'package:tmdb_api/tmdb_api.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  List topRatedMovies= [];
  List tvShows = [];
  List upcomming = [];
  final String apikey = '59293fadfeaa9f09a9804d66fca332de';
  final String readAccessToken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1OTI5M2ZhZGZlYWE5ZjA5YTk4MDRkNjZmY2EzMzJkZSIsIm5iZiI6MTcyODY1OTYzMi4yMDcwMDcsInN1YiI6IjY3MDhkYjU0YzVmY2Y1YTE2MzRmNTgyYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.etmX0xqGx87zAdTheoikDM2eqPdt9FEiiRp7oqDAgf8';
  @override
  void initState()
  {
    loadMovies();
    super.initState();
  }
  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apikey, readAccessToken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvShowsResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upcommongMovies = await tmdbWithCustomLogs.v3.movies.getUpcoming();

    setState(() {
      topRatedMovies=topRatedResult['results'];
      tvShows=tvShowsResult['results'];
      upcomming=upcommongMovies['results'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title:const  ModifiedText(text: 'Movie App', color: Colors.white, size: 20),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          TV(tvShows: tvShows),
          TopRatedMovies(topratedmovies: topRatedMovies),
          Upcomming(upcomming: upcomming),

        ],
      ),
    );
  }
}