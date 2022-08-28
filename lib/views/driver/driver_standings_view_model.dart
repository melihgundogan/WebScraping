

import 'package:flutter/material.dart';
import 'package:formula_one_app/views/driver/driver_view.dart';
import 'package:formula_one_app/views/driver/model/driver_model.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;




abstract class DriverViewModel extends State<DriverView> {


  List<DriverModel> models = [];

  @override
  void initState() {
    super.initState();
    getWebsiteData();
  }

  Future getWebsiteData() async {
    final url = Uri.parse('https://www.formula1.com/en/drivers.html');
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);

    final ranks = html
        .querySelectorAll('a > fieldset > div.listing-standing > div.rank')
        .map((e) => e.innerHtml.trim())
        .toList();

    final points = html.querySelectorAll('a > fieldset > div.listing-standing > div.points > div.f1-wide--s').map((e) => e.innerHtml.trim()).toList();    

    final names = html.querySelectorAll('a > fieldset > div.container > div > div.col-xs-8.listing-item--name.f1-uppercase > span.d-block.f1--xxs.f1-color--carbonBlack').map((e) => e.innerHtml.trim()).toList();

    final surnames = html.querySelectorAll('a > fieldset > div.container > div > div.col-xs-8.listing-item--name.f1-uppercase > span.d-block.f1-bold--s.f1-color--carbonBlack').map((e) => e.innerHtml.trim()).toList();

    final teams = html.querySelectorAll('a > fieldset > p').map((e) => e.innerHtml.trim()).toList();

    final photos = html.querySelectorAll('a > fieldset > div.listing-item--image-wrapper.f1-pattern-fill > picture.listing-item--photo > img').map((e) => e.attributes['data-src']!).toList();

    final flags = html.querySelectorAll('a > fieldset > div.container > div > div.col-xs-4.country-flag > picture > img').map((e) => e.attributes['data-src']!).toList();

    final driverNumbers = html.querySelectorAll('a > fieldset > div.listing-item--image-wrapper.f1-pattern-fill > picture.listing-item--number > img').map((e) => e.attributes['data-src']!).toList();


    print('Count: ${ranks.length}');
    setState(() {
      models = List.generate(ranks.length,
          (index) => DriverModel(
            rank: ranks[index],
            point: points[index],
            photo: photos[index],
            name: names[index],
            surname: surnames[index],
            flag: flags[index],
            driverNumber: driverNumbers[index],
            team: teams[index],
          ));
    });
  }



}