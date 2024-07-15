import 'package:flexmovies/description.dart';
import 'package:flexmovies/utilis/text.dart';
import 'package:flutter/material.dart';

class TopRated extends StatelessWidget {
  final List? toprated;
  const TopRated({super.key, this.toprated});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifiedText(
              text: "TopRated Movies",
              size: 25,
              color: Colors.white,
            ),
            SizedBox(height: 15),
            Container(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: toprated?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(
                        bannerurl: 'https://image.tmdb.org/t/p/w500'+toprated![index]['backdrop_path'],
                        posterurl: 'https://image.tmdb.org/t/p/w500'+toprated![index]['poster_path'],
                        description: toprated![index]['overview'],
                        vote: toprated![index]['vote_average'].toString(),
                        first_air_date: toprated![index]['first_air_date']
                      )));
                    },
                    child: Container(
                      width: 140,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      (toprated?[index]['poster_path'] ?? ''),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          ModifiedText(
                            text: toprated?[index]['title'] ?? 'Loading',
                            size: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
