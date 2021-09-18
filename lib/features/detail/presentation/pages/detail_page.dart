import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../core/util/constant_helper.dart';
import '../../../favourite/presentation/bloc/favourite_bloc.dart';
import '../../../show/domain/entities/restaurants.dart';

class DetailPage extends StatefulWidget {
  final Restaurants restaurants;
  final FavouriteBloc favouriteBloc;

  const DetailPage({Key? key, required this.restaurants, required this.favouriteBloc}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget.favouriteBloc,
      listener: (context, state) {
        if(state is AddFavouriteState){
          Get.snackbar('Restaurant2','Success Add favourite',snackPosition: SnackPosition.BOTTOM);
          debugPrint('Success Add favourite');
        }
      },
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      imageUrl: ConstantHelper.GET_IMAGE_RESTAURANT +
                          widget.restaurants.pictureId!,
                      colorBlendMode: BlendMode.darken,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.restaurants.name!,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          InkWell(
                              onTap: () => widget.favouriteBloc.add(AddFavouriteEvent(
                                  restaurants: widget.restaurants)),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 40,
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.location_on),
                          Text(widget.restaurants.city!),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(widget.restaurants.description!),
                    ),
                  ],
                ),
                Positioned(
                    top: 8,
                    left: 8,
                    height: 40,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
