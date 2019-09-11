import 'package:flutter/material.dart';
import 'package:flutter_bloc_test/weatureInfo.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc Demo",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => WeatureInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Provider pattern"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[MySpecialHeading(), MySpecialContent()],
          ),
        ),
        floatingActionButton: MyFloatingActionButton(),
      ),
    );
  }
}

class MySpecialHeading extends StatelessWidget {
  Color decideColor(WeatureInfo info) {
    return info.temperatureType == "ceicius" ? Colors.green : Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<WeatureInfo>(
          builder: (context, weatherInfo, _) => Text(
                weatherInfo.temperatureType,
                style:
                    TextStyle(color: decideColor(weatherInfo), fontSize: 25.0),
              )),
    );
  }
}

class MySpecialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text("Temperature Value"),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  Color decideColor(WeatureInfo info) {
    return info.temperatureType == "ceicius" ? Colors.green : Colors.deepOrange;
  }

  @override
  Widget build(BuildContext context) {
    var weatherinfo = Provider.of<WeatureInfo>(context);

    return FloatingActionButton(
      backgroundColor: decideColor(weatherinfo),
      onPressed: () {
        String newWeatherType =
            weatherinfo.temperatureType == "ceicius" ? "far" : "ceicius";
        weatherinfo.temperatureType = newWeatherType;
      },
      tooltip: 'Change Type',
      child: Icon(Icons.change_history),
    );
  }
}
