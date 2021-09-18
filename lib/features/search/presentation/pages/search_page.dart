import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant2/features/favourite/presentation/bloc/favourite_bloc.dart';
import 'package:restaurant2/features/search/presentation/bloc/search_bloc.dart';
import 'package:restaurant2/features/show/presentation/widget/widget_item.dart';
import 'package:restaurant2/injection_container.dart';

class SearchPage extends StatefulWidget {
  final FavouriteBloc favouriteBloc;
  SearchPage({Key? key, required this.favouriteBloc}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchBloc _searchBloc;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchBloc = sl<SearchBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Search"),
        centerTitle: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextFormField(
                controller: _searchController,
                onChanged: (String query) {
                  _searchBloc.add(GetSearchEvent(query: query));
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[800]),
                    hintText: "Type in your text",
                    fillColor: Colors.white70),
              ),
            ),
          ),
          BlocBuilder(
            bloc: _searchBloc,
            builder: (context, state) {
              return Expanded(
                child: SingleChildScrollView(
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
                            : Container(
                                child: state is GetSearchState
                                    ? state.listRestaurants!.length > 0
                                        ? ListView.builder(
                                            primary: false,
                                            shrinkWrap: true,
                                            itemCount:
                                                state.listRestaurants!.length,
                                            itemBuilder: (context, index) {
                                              return WidgetItem(
                                                restaurants: state
                                                    .listRestaurants![index], favouriteBloc: widget.favouriteBloc,
                                              );
                                            })
                                        : Center(
                                            child: Container(
                                              child: Text(
                                                  "Did not find any result",
                                                  textAlign: TextAlign.center),
                                            ),
                                          )
                                    : Center(
                                        child: Container(
                                          child: Text(
                                              "Finding Restaurant \n For You Please Wait...",
                                              textAlign: TextAlign.center),
                                        ),
                                      ),
                              )),
              );
            },
          ),
        ],
      ),
    );
  }
}
