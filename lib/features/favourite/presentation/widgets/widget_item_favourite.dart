import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/util/constant_helper.dart';
import '../../../show/domain/entities/restaurants.dart';
import '../bloc/favourite_bloc.dart';
import '../pages/favourite_detail_page.dart';

class WidgetItemFavourite extends StatelessWidget {
  final Restaurants restaurants;
  final FavouriteBloc favouriteBloc;

  const WidgetItemFavourite({Key? key, required this.restaurants, required this.favouriteBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => FavouriteDetailPage(restaurants: restaurants, favouriteBloc: favouriteBloc,));
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: CachedNetworkImage(
                width: 150,
                height: 100,
                imageUrl: ConstantHelper.GET_IMAGE_RESTAURANT +
                    restaurants.pictureId!,
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurants.name!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(restaurants.city!),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(
                        width: 8.0,
                      ),
                      Text(restaurants.rating!.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
