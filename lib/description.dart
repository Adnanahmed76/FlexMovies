import 'package:flexmovies/utilis/text.dart';
import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  final String? original_name, description, bannerurl, posterurl, vote, first_air_date;

  const Description({
    super.key,
    this.original_name,
    this.description,
    this.bannerurl,
    this.posterurl,
    this.vote,
    this.first_air_date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModifiedText(text: "Description",size: 20,color: Colors.white,),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: bannerurl != null 
                        ? Image.network(bannerurl!, fit: BoxFit.cover) 
                        : Container(color: Colors.grey), // Placeholder for null bannerurl
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: ModifiedText(
                      color: Colors.white,
                      size: 18,
                      text: "Average Rati ⭐- ${vote ?? 'N/A'}", // Default value if vote is null
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: 15,
          ),
      
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                height: 200,
                width: 100,
                child: posterurl!=null ? Image.network(posterurl!,fit: BoxFit.cover,):Container(color: Colors.grey,)
              ),
              SizedBox(height: 10,),
              Flexible(child: Container(
               
child: ModifiedText(
  text: description,size: 18,color: Colors.white,
),
              ))
            ],
          )
          ],
        ),
      ),
    );
  }
}
