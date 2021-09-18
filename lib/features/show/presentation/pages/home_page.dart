import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:restaurant2/core/util/notification_helper.dart';
import 'package:restaurant2/core/util/scheduling_provider.dart';
import 'package:restaurant2/features/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:restaurant2/features/favourite/presentation/pages/favourite_page.dart';
import 'package:restaurant2/features/search/presentation/pages/search_page.dart';
import 'package:restaurant2/features/show/presentation/bloc/show_bloc.dart';
import 'package:restaurant2/features/show/presentation/pages/setting_page.dart';
import 'package:restaurant2/features/show/presentation/widget/widget_item.dart';
import 'package:restaurant2/injection_container.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _pinned = true;
  var _snap = false;
  var _floating = false;
  var _stretch = true;
  late ShowBloc _showBloc;
  late FavouriteBloc _favouriteBloc;
  final NotificationHelper _notificationHelper = NotificationHelper();

  List<Widget> _listWidget = [
    ChangeNotifierProvider<SchedulingProvider>(
      create: (_) => SchedulingProvider(),
      child: SettingPage(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _showBloc = sl<ShowBloc>();
    _favouriteBloc = sl<FavouriteBloc>();
    _showBloc.add(GetRestaurantEvent());
    _notificationHelper.configureSelectNotificationSubject();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: _pinned,
            floating: _floating,
            snap: _snap,
            stretch: _stretch,
            expandedHeight: 100.0,
            backgroundColor: Colors.amber,
            title: Text(widget.title),
            centerTitle: false,
            actions: [
              InkWell(
                onTap: () {
                  Get.to(()=> FavouritePage(favouriteBloc: _favouriteBloc,));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(Icons.favorite, color: Colors.red,),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(()=> SearchPage(favouriteBloc: _favouriteBloc,));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(Icons.search),
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(()=> SettingPage());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(Icons.settings),
                ),
              )
            ],
          ),
          BlocBuilder(
            bloc: _showBloc,
            builder: (context, state) {
              return SliverToBoxAdapter(
                child: state is LoadingState
                    ? Container(
                        margin: EdgeInsets.only(top: 100),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : state is NetworkErrorState
                        ? Container(
                          margin: EdgeInsets.only(top: 100),
                            child: Text(
                              "Network Error, \n Please check your connection",
                              textAlign: TextAlign.center,
                            ),
                          )
                        : state is GetRestaurantState
                            ? ListView.builder(
                                primary: false,
                                shrinkWrap: true,
                                itemCount:
                                    state.listRestaurants.restaurants!.length,
                                itemBuilder: (context, index) {
                                  return WidgetItem(
                                    restaurants: state
                                        .listRestaurants.restaurants![index], favouriteBloc: _favouriteBloc,
                                  );
                                })
                            : Container(
                                child: Center(
                                  child: Text("Terjadi Kesalahan"),
                                ),
                              ),
              );
            },
          )
        ],
      ),
    );
  }
}
