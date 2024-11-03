import 'package:flutter/material.dart';
import 'package:movieapp/description.dart';
import 'package:movieapp/utils/text.dart';
class Upcomming extends StatelessWidget
{
  final List upcomming;
  const Upcomming({super.key,required this.upcomming});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
              text: 'Upcomming Movies', color: Colors.white, size: 26),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 270,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcomming.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(name: upcomming[index]['title'], description:  upcomming[index]['overview'], bannerUrl:
                      'https://image.tmdb.org/t/p/w500/' +
                          upcomming[index]['backdrop_path']
                          , posterUrl:  'https://image.tmdb.org/t/p/w500/' +
                              upcomming[index]['poster_path'], vote: 'Not Rated', launchingDate: upcomming[index]['release_date'])));
                    },
                    child: upcomming[index]['title']!=null? Container(
                      width: 140,
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500/' +
                                            upcomming[index]['poster_path']))),
                          ),
                          Container(
                            child: ModifiedText(
                                text: upcomming[index]['title'] != null
                                    ? upcomming[index]['title']
                                    : 'Loading',
                                color: Colors.white,
                                size: 15),
                          )
                        ],
                      ),
                    ): Container(),
                  );
                }),
          )
        ],
      ),
    );
  }


}
