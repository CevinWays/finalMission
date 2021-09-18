import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant2/features/favourite/presentation/widgets/widget_item_favourite.dart';

import '../../../../injection_container.dart';
import '../../../show/presentation/widget/widget_item.dart';
import '../bloc/favourite_bloc.dart';

class FavouritePage extends StatefulWidget {
  final FavouriteBloc favouriteBloc;
  const FavouritePage({Key? key, required this.favouriteBloc}) : super(key: key);

  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  @override
  void initState() {
    super.initState();
    widget.favouriteBloc.add(GetFavouriteEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return BlocBuilder(
      bloc: widget.favouriteBloc,
      builder: (context, state) {
        return SingleChildScrollView(
          child: state is GetFavouriteState
              ? ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: state.listRestaurant.length,
                  itemBuilder: (BuildContext context, int index) {
                    return WidgetItemFavourite(restaurants: state.listRestaurant[index], favouriteBloc: widget.favouriteBloc,);
                  },
                )
              : Container(
                  child: Center(
                    child: Text(
                        "Tidak ada favorite, silahkan tambahkan terlebih dahulu"),
                  ),
                ),
        );
      },
    );
  }

  PreferredSizeWidget buildAppbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.amber,
      title: Text('Favourites'),
    );
  }
}
