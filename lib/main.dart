import 'package:country_provider/Provider/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => Country())],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Country',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var country = context.watch<Country>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Country'),
      ),
      body: country.countryList.length == 0
          ? Center(child: Text("No Data"))
          : Scrollbar(
              child: ListView.builder(
                itemCount: country.countryList.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      child: SvgPicture.network(
                        country.countryList[i].flagURL,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(country.countryList[i].name),
                    subtitle: Text(country.countryList[i].region),
                    trailing: IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        if (country.countryList.length >= i) {
                          country.deleteCountry(i);
                        }
                      },
                    ),
                  );
                },
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: country.getData,
        tooltip: 'Fetch',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
