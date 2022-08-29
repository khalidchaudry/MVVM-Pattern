import 'package:flutter/material.dart';
import 'package:mvvm/data/response/status.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view_model/home_view_model.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel homeViewModel = HomeViewModel();
  @override
  void initState() {
    homeViewModel.movieErrorMessage(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userPreference = Provider.of<UserViewModel>(context);
    final homeProvider = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () => userPreference.removeUser().then((value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  }),
              child: Text('LogOut'.toUpperCase()))
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: ChangeNotifierProvider<HomeViewModel>(
              create: (context) => homeViewModel,
              child: Consumer<HomeViewModel>(builder: (context, value, child) {
                switch (value.movieList.status) {
                  case Status.LOADING:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case Status.ERROR:
                    return Center(
                      child: Text(value.movieList.message.toString()),
                    );
                  case Status.COMPLETED:
                    return ListView.builder(
                        itemCount: 50,
                        itemBuilder: (context, index) => ListTile(
                              title: Text(value
                                  .movieList.data!.movies![index].title
                                  .toString()),
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(value
                                    .movieList.data!.movies![index].posterurl
                                    .toString()),
                              ),
                              subtitle: Text(value
                                  .movieList.data!.movies![index].releaseDate
                                  .toString()),
                              trailing: Text(value
                                  .movieList.data!.movies![index].imdbRating
                                  .toString()),
                            ));

                  default:
                }
                return const SizedBox();
              }),
            )),
      ),
    );
  }
}
