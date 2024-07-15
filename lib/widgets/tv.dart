import 'package:flexmovies/description.dart';
import 'package:flexmovies/utilis/text.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';

class TV extends StatelessWidget {
  final List? tv;
  const TV({super.key, this.tv});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ModifiedText(
              text: "Pupolar TV Show",
              size: 25,
              color: Colors.white,
            ),
            SizedBox(height: 15),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tv?.length ?? 0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Description(original_name: tv![index]['title'],
                      bannerurl: 'https://image.tmdb.org/t/p/w500'+tv![index]['backdrop_path'],
posterurl:  'https://image.tmdb.org/t/p/w500'+tv![index]['poster_path'],
description: tv![index]['overview'],
vote: tv![index]['vote_average'].toString(),
first_air_date: tv![index]['release_date'],

                      )));
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      width: 250,
                      margin: EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            height: 140,
                            width: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/w500' +
                                      (tv?[index]['backdrop_path'] ?? ''),
                                ),
                            fit: BoxFit.cover  
                              ),
                              
                            ),
                            
                          ),
                          SizedBox(height: 10),
                          Center(
                            child: ModifiedText(
                              text: tv?[index]['original_name'] ?? 'Loading',
                              size: 15,
                              color: Colors.white,
                            ),
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
