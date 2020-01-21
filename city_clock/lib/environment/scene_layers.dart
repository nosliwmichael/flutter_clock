import 'package:flutter/widgets.dart';
import 'package:global_configuration/global_configuration.dart';

Widget loadSky() {
  return Image(
    image: AssetImage(GlobalConfiguration().getString("skyNight")),
    fit: BoxFit.fitWidth,
  );
}

Widget loadCityBack() {
  return Image(
    image: AssetImage(GlobalConfiguration().getString("cityBackNight")),
    fit: BoxFit.fitWidth,
  );
}

Widget loadCityFront() {
  return Image(
    image: AssetImage(GlobalConfiguration().getString("cityFrontNight")),
    fit: BoxFit.fitWidth,
  );
}

Widget loadStreet() {
  return Image(
    image: AssetImage(GlobalConfiguration().getString("streetNight")),
    fit: BoxFit.fitWidth,
  );
}

Widget loadSign() {
  return Image(
    image: AssetImage(GlobalConfiguration().getString("signNight")),
    fit: BoxFit.fitWidth,
  );
}
