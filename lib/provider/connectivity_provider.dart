// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:payapp/ui/screens/no_internet_connection.dart';
//
// class ConnectivityProvider extends ChangeNotifier {
//   bool _isConnected = true;
//   bool _wasConnected = true;
//   String? _previousRoute;
//
//   bool get isConnected => _isConnected;
//   bool get wasConnected => _wasConnected;
//   String? get previousRoute => _previousRoute;
//
//   Future<void> checkInternetConnectivity(BuildContext context) async {
//     ConnectivityResult connectivityResult =
//     await Connectivity().checkConnectivity();
//
//     _wasConnected = _isConnected;
//     _isConnected = (connectivityResult != ConnectivityResult.none);
//     notifyListeners();
//
//     if (!_wasConnected && _isConnected && _previousRoute != null) {
//       Navigator.pushNamed(context, _previousRoute!);
//     } else if (!_isConnected) {
//       _previousRoute = ModalRoute.of(context)?.settings.name;
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => const NoInternetConnection(),
//           settings: const RouteSettings(name: '/nointernet'),
//         ),
//       );
//     }
//   }
// }