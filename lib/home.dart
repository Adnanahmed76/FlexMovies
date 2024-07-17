import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flexmovies/phone_home.dart';
import 'package:flexmovies/utilis/text.dart';
import 'package:flexmovies/widgets/toprated.dart';
import 'package:flexmovies/widgets/trending.dart';
import 'package:flexmovies/widgets/tv.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_api/tmdb_api.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> { 
  final user=FirebaseAuth.instance.currentUser;
  signout()async{
    await FirebaseAuth.instance.signOut();
  }
  List trendingmovies=[];
  List topratedmovies=[];
  List tv=[];
  final String apiKey='9abec7f9c64fb4f5ac7e16d6c86ed62b';
  final readaccestoken='eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YWJlYzdmOWM2NGZiNGY1YWM3ZTE2ZDZjODZlZDYyYiIsIm5iZiI6MTcyMDcxMjE2MC4wMDAzMzcsInN1YiI6IjY2OGZmYWI0ZmVhNTFiZmE5MWI1M2Y2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Vkea7-W_fmOfcNILwSx6YNyDbBGsF6H-o7xApAxTAYw';
 @override
  void initState() {
   loadmovies();
    super.initState();
  }
  loadmovies()async{
    TMDB tmdbwithCustomLogs=TMDB(ApiKeys('9abec7f9c64fb4f5ac7e16d6c86ed62b', 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YWJlYzdmOWM2NGZiNGY1YWM3ZTE2ZDZjODZlZDYyYiIsIm5iZiI6MTcyMDcxMjE2MC4wMDAzMzcsInN1YiI6IjY2OGZmYWI0ZmVhNTFiZmE5MWI1M2Y2OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Vkea7-W_fmOfcNILwSx6YNyDbBGsF6H-o7xApAxTAYw'),
    logConfig: ConfigLogger(
      showLogs: true,
      showErrorLogs: true,

    )
    );
Map trendingresult=await tmdbwithCustomLogs.v3.trending.getTrending();
Map topratedresult=await tmdbwithCustomLogs.v3.movies.getTopRated();
Map tvresult=await tmdbwithCustomLogs.v3.tv.getPopular();



setState(() {
  trendingmovies=trendingresult['results']??[];
  topratedmovies=topratedresult['results']??[];
  tv=tvresult['results']??[];
});
print(tv);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: ModifiedText(text: "Flex Movies",color: Colors.white,size: 25,)

      ),
body: ListView(
 children: [
  TV(tv: tv,),
  TopRated(toprated: topratedmovies,),
 TrendingMovies(trending:trendingmovies),

 ],
),
    );
  }
}