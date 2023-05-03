import 'package:flutter/material.dart';
import 'package:flymovies/components/top_rated_item.dart';
import 'package:flymovies/controllers/movie_controller.dart';
import 'package:get/get.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  // late var _movies;
  // late final _mController;

  final MovieController controller = Get.put(MovieController());

  @override
  void initState() {
    super.initState();
    // _mController = MovieController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      (() => controller.isLoading.value
          ? const CircularProgressIndicator()
          : Container(
              alignment: Alignment.center,
              color: Colors.green[100],
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5),
                itemCount: controller.mainTopRatedMovies.length,
                // shrinkWrap: true,
                scrollDirection: Axis.vertical,
                //separatorBuilder: (_, __) => const SizedBox(width: 24),
                itemBuilder: (_, index) => TopRatedItem(
                    movie: controller.mainTopRatedMovies[index],
                    index: index + 1),
              ),
            )),
    ));
  }
}
