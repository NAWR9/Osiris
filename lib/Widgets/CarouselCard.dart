import 'package:flutter/material.dart';
import 'package:osiris/Models/PopularMovies.dart';
import 'package:osiris/Models/TvShow.dart';
import 'package:osiris/Widgets/LandingCard.dart';

class CustomCarouselSlider extends StatelessWidget {
  CustomCarouselSlider(this.future, {super.key});
  Future<List<TvShow>> future;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.33,
      child: FutureBuilder(
          future: future,
          builder: ((context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: 20,
                shrinkWrap: true,
                itemBuilder: ((context, index) {
                  var url = snapshot.data![index].backdropPath.toString();
                  return LandingCard(
                      NetworkImage("https://image.tmdb.org/t/p/original$url"),
                      snapshot.data![index].name.toString());
                }),
              );
            } else {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: ((context, index) {
                    return LandingCard(
                        const AssetImage("assets/LoadingImage.png"), "Loading");
                  }));
            }
          })),
    );
  }
}
