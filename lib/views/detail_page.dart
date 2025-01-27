import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import '../controllers/weather_controller.dart';

class DetailPage extends StatefulWidget {
  final WeatherModel weather;
  const DetailPage({Key? key, required this.weather}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<WeatherController>(context, listen: false).isDarkMode;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor:
              isDarkMode == true ? Colors.black : Colors.white,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: isDarkMode == true
                  ? Colors.black // Color.fromARGB(255, 42, 41, 41)
                  : Color.fromARGB(255, 150, 2, 255),
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.weather.cityName.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            body: Container(
                decoration: isDarkMode == true
                    ? const BoxDecoration(
                        color: Colors.black) // Color.fromARGB(255, 42, 41, 41))
                    : const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          //   end: Alignment.bottomCenter,
                          end: Alignment(0.9, 1),
                          colors: <Color>[
                            Color.fromARGB(255, 150, 2, 255),
                            Color.fromARGB(255, 185, 42, 144),
                          ], // Gradient from https://learnui.design/tools/gradient-generator.html
                          tileMode: TileMode.mirror,
                        ),
                      ),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.3,
                          margin: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 60, 60, 60),
                              style: isDarkMode == true
                                  ? BorderStyle.solid
                                  : BorderStyle.none,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: isDarkMode == true
                                    ? Colors.transparent
                                        .withOpacity(0.1) //Colors.grey.shade900
                                    : Colors.transparent.withOpacity(0.1),
                                offset: const Offset(1, 2),
                                blurRadius: 3,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Padding(
                              padding: EdgeInsets.all(15),
                              child: ListTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.pin_drop,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    Text(
                                      widget.weather.cityName.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: isDarkMode == true
                                            ? Colors.white
                                            : Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.weather.temperature.toString().substring(0, 2)}°',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 100,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    Center(
                                        child: Text(
                                      '${widget.weather.main} ${widget.weather.temp_min.toString().substring(0, 2)}° / ${widget.weather.temp_max.toString().substring(0, 2)}°',
                                      style: TextStyle(
                                          color: isDarkMode == true
                                              ? Colors.white
                                              : Colors.white,
                                          fontSize: 16),
                                    )),
                                  ],
                                ),
                              ))),
                      Container(
                        width: double.infinity,
                        foregroundDecoration:
                            const BoxDecoration(color: Colors.transparent),
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 60, 60, 60),
                            style: isDarkMode == true
                                ? BorderStyle.solid
                                : BorderStyle.none,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isDarkMode == true
                                  ? Colors.transparent
                                      .withOpacity(0.1) //Colors.grey.shade900
                                  : Colors.transparent.withOpacity(0.1),
                              offset: const Offset(1, 2),
                              blurRadius: 3,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: ListTile(
                              title: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Feels Like',
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: isDarkMode == true
                                          ? Colors.white
                                          : Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${widget.weather.feels_like.toString().substring(0, 2)}°C',
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 28,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Image(
                                        image: const AssetImage(
                                            'images/temperature.png'),
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.08,
                                      ),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image: const AssetImage(
                                                'images/termometer.png'),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'High/Low',
                                            style: TextStyle(
                                              color: isDarkMode == true
                                                  ? Colors.white
                                                  : Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                          '${widget.weather.temp_min.toString().substring(0, 2)}°/${widget.weather.temp_max.toString().substring(0, 2)}°',
                                          style: TextStyle(
                                            color: isDarkMode == true
                                                ? Colors.white
                                                : Colors.white,
                                          ))
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image: const AssetImage(
                                                'images/wind.png'),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('Wind',
                                              style: TextStyle(
                                                color: isDarkMode == true
                                                    ? Colors.white
                                                    : Colors.white,
                                              )),
                                        ],
                                      ),
                                      Text(
                                          '${widget.weather.speed.toString()} km/h',
                                          style: TextStyle(
                                            color: isDarkMode == true
                                                ? Colors.white
                                                : Colors.white,
                                          ))
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image: const AssetImage(
                                                'images/humidity.png'),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('Humidity',
                                              style: TextStyle(
                                                color: isDarkMode == true
                                                    ? Colors.white
                                                    : Colors.white,
                                              )),
                                        ],
                                      ),
                                      Text(
                                          '${widget.weather.humidity.toString()}%',
                                          style: TextStyle(
                                            color: isDarkMode == true
                                                ? Colors.white
                                                : Colors.white,
                                          )),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image: const AssetImage(
                                                'images/arrows.png'),
                                            color: Colors.white,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('Pressure',
                                              style: TextStyle(
                                                color: isDarkMode == true
                                                    ? Colors.white
                                                    : Colors.white,
                                              )),
                                        ],
                                      ),
                                      Text(
                                          ' ${widget.weather.pressure.toString()} mb',
                                          style: TextStyle(
                                            color: isDarkMode == true
                                                ? Colors.white
                                                : Colors.white,
                                          )),
                                    ],
                                  ),
                                  const Divider(
                                    color: Colors.white,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image(
                                            image: const AssetImage(
                                                'images/visibility.png'),
                                            color: Colors.white,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('Visibility',
                                              style: TextStyle(
                                                color: isDarkMode == true
                                                    ? Colors.white
                                                    : Colors.white,
                                              )),
                                        ],
                                      ),
                                      widget.weather.visibility == null
                                          ? Text('0.0 km',
                                              style: TextStyle(
                                                color: isDarkMode == true
                                                    ? Colors.white
                                                    : Colors.white,
                                              ))
                                          : Text(
                                              '${widget.weather.visibility.toString()} km',
                                              style: TextStyle(
                                                color: isDarkMode == true
                                                    ? Colors.white
                                                    : Colors.white,
                                              )),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      )
                    ])))));
  }
}
