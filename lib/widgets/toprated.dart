import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/description.dart';
class TopRatedMovies extends StatelessWidget
{
  final List topratedmovies ;
  const TopRatedMovies({super.key,
  required this.topratedmovies
  });
  @override
  Widget build(BuildContext context) {
    return   Container(
      padding:const  EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const  ModifiedText(text: 'Top Rated Movies', color: Colors.white, size: 26),
          const  SizedBox(height: 10,),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: topratedmovies.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Description(
                                  name: topratedmovies[index]['title'],
                                  description: topratedmovies[index]['overview'],
                                  bannerUrl:
                                  'https://image.tmdb.org/t/p/w500/' +
                                      topratedmovies[index]['backdrop_path'],
                                  posterUrl:
                                  'https://image.tmdb.org/t/p/w500/' +
                                      topratedmovies[index]['poster_path'],
                                  vote: topratedmovies[index]['vote_average'].toString(),
                                  launchingDate: topratedmovies[index]
                                  ['release_date'])));

                    },
                    child:topratedmovies[index]['title'] != null?  Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/' +
                                            topratedmovies[index]['poster_path']))),
                          ),
                          Container(
                            child: ModifiedText(
                                text: topratedmovies[index]['title'] != null
                                    ? topratedmovies[index]['title']
                                    : 'Loading',
                                color: Colors.white,
                                size: 15),
                          )
                        ],
                      ),
                    ):Container(),
                  );
                }),
          )
        ],
      ),
    );
  }

}
