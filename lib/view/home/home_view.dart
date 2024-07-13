import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../res/colors/app_color.dart';
import '../../view_models/controller/home/home_view_models.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: AppColor.primaryColor,
          systemNavigationBarColor: AppColor.primaryColor),
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        body: SafeArea(
            child: Obx(
          () => RefreshIndicator(
            onRefresh: () async {
              homeController.getWeatherData();
            },
            color: Colors.white,
            backgroundColor: AppColor.primaryColor,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 12),
                      controller: homeController.cityNameController,
                      onFieldSubmitted: (val) {
                        homeController.getWeatherData();
                      },
                      decoration: InputDecoration(
                          hintText: "Search by city",
                          hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5))),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.white.withOpacity(0.5))),
                          suffixIcon: IconButton(
                            onPressed: () {
                              homeController.getWeatherData();
                            },
                            icon: Icon(
                              Icons.search,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        homeController.getWeatherData();
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                                color: Colors.white.withOpacity(0.5))),
                      ),
                      child: Text(
                        "Fetch weather",
                        style: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      homeController.weatherData.value.name ?? "",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 15),
                    ),
                    homeController.weatherData.value.main?.temp == null
                        ? const Text("")
                        : Text(
                            "${homeController.weatherData.value.main?.temp ?? ""}\u2103",
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 30),
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      homeController.weatherData.value.weather?.first.main ??
                          "",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.5), fontSize: 20),
                    ),
                    Image.network(
                      "https://openweathermap.org/img/wn/${homeController.weatherData.value.weather?.first.icon}@2x.png",
                      color: Colors.white,
                      errorBuilder: (a, b, c) {
                        return const Icon(
                          Icons.error,
                          color: Colors.transparent,
                        );
                      },
                      height: 100,
                      width: 100,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
