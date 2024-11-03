import 'package:flutter/material.dart';
import 'package:movieapp/utils/text.dart';
import 'package:movieapp/description.dart';
class TV extends StatelessWidget {
  final List tvShows;
  const TV({super.key, required this.tvShows});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top TV Shows',
            color: Colors.white,
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 210,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tvShows.length,
              itemBuilder: (context, index) {
                // Handling null values with fallback
                final backdropPath = tvShows[index]['backdrop_path'] ?? '';
                final originalName = tvShows[index]['original_name'] ?? 'Unknown';

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Description(
                          name: originalName,
                          description: tvShows[index]['overview'],
                          bannerUrl: 'https://image.tmdb.org/t/p/w500/$backdropPath',
                          posterUrl: 'https://image.tmdb.org/t/p/w500/${tvShows[index]['poster_path']}',
                          vote: tvShows[index]['vote_average'].toString(),
                          launchingDate: tvShows[index]['first_air_date'],
                        ),
                      ),
                    );
                  },
                  child: backdropPath.isNotEmpty && originalName.isNotEmpty
                      ? Container(
                    padding: const EdgeInsets.all(5),
                    width: 250,
                    child: Column(
                      children: [
                        Container(
                          width: 250,
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                'https://image.tmdb.org/t/p/w500/$backdropPath',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ModifiedText(
                          text: originalName,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  )
                      : Container(), // Empty container when no backdropPath
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
