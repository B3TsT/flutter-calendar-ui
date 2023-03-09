// import 'package:country_provider2/country_provider2.dart';
// import 'package:intl/intl.dart';
// import 'package:timezone/timezone.dart' as tz;

// class CountrysP {
//   Future<Country> getCountryByIsoCode(String isoCode) async {
//     final countryProvider = CountryProvider();
//     // final country = await countryProvider.getCountryByCode(isoCode).;

//     return countryProvider.getCountryByCode(isoCode).then((value) => value);
//     // return country;
//   }

//   Future<Country> getCountryByCode(String isoCode) async {
//     Country result;
//     final cP = CountryProvider();
//     result = await cP.getCountryByCode("lmt");
//     // final country = await countryProvider.getCountryByIsoCode("US");
// // final alpha3Code = country?.alpha3Code;
//     print(result.region);
//     return result;
//   }

//   Future<Country?> getCountryByUtcOffset(String utcOffset) async {
//     final cP = CountryProvider();
//     final countryCode = Intl.canonicalizedLocale(utcOffset).substring(3);
//     if (countryCode != null) {
//       // Buscamos el país utilizando el código ISO de dos letras
//       final country = await cP.getCountryByCode(countryCode);
//       return country;
//     } else {
//       return null;
//     }
//     // return country;
//   }
// }
