import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class BiometricAuth extends StatefulWidget {
  final LocalAuthentication _auth = LocalAuthentication();

  BiometricAuth({super.key});

  Future<bool> isDeviceSupported() async {
    return await _auth.isDeviceSupported();
  }

  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Sentuh sensor sidik jari atau arahkan wajah ke kamera depan',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      print('Error during authentication: $e');
      return false;
    }
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  // Future<void> _getAvailableBiometrics() async {
  //   List<BiometricType> availableBiometrics = await _auth.getAvailableBiometrics();
  //   print('List of availableBiometrics : $availableBiometrics');
  //
  //   if (!mounted) {
  //     return;
  //   }
  // }
}
