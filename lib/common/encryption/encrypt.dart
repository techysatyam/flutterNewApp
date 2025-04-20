import 'dart:convert';

import 'package:aes256gcm/aes256gcm.dart';
import 'package:encrypt/encrypt.dart';
// import 'package:fast_rsa/fast_rsa.dart' as FAST;
import 'package:pointycastle/asymmetric/api.dart';

import 'key_constant.dart';

void main() async {
  String key =
      "NtYXm4hgnStrV7c8TiIeVuMmvn6srhC6dxMpWnlFczKIG0EEZnhFW9FAazO2JEiXHMAg2xESnHsA8N/8P/qNQegEF/yrb7TkicL2OcGUxVpZSBj4lAzaMgS1RrMQIpgMwi3PoQQdANg+4ilYO8v6t0mnWZq0lilyuDKDD+03uDhXvtV+t3uKI55maSG2iuMc2M0kFwcc+aRAKaHCRznLc1s5eY4HTV+0zXwgXbWudqnxITVdwfszoYoBgw3PsU9mbqxDi29xAIGZV7B9Zm/y8chec5MGsElhaUZO48nzYGE8/tDpyJDCx+IebZxxGDU/BkjB3DCNw5bqEDhVslnRLAq48Kh1UDrlRpCoqyEdifHM0uSuureDtjQ9ufg+LPOCH4f2kVkEBHMg32J3siufB+2N6MnTwY5a8dcmIa8zwdJ9LJ27PAsEydtY9VPtwiENY+JGjHK79rFi9WERV2VJME81Zd3tnfQCzi5NKrYgukgOL5nP8K+AylU6tOH+WuAD4IhKQiHuY0ORtjRCqe1WpgHqrgCT0YDjGQqcFRERvd6DBQ60PfVKhVbAE3TGnOQxKPIO5uccNBxkQTPTTzSrKVTHWKVWyCcxsTMUI4simYlka89KMZ0p85RqNZZ3VF/zxhC+JuK/CMurKRy9KmaGB2qYS/cLRpAhQAyx8s0YJgc=";
  String response =
      "b3b3c658abfdcf2bb03938ed81be58307c06743d909c02d586b1ef55f15ddae003f83a15a8dea6ed2f6b4e59e83be5093cf9f1952b5ed73e90a5c29c54cdc5d36078ff08e1e0169cd3cc6b4a9184f37cc685be3b9b8a05eeaca8355b94450cfe247934d5f193a58be5298131b49d071df3cbefce4d43d3bf565cb71a24aa18c8e0efbeafa7d61f3f4e51198e6eff547d110d9bf6b248faa61605107397a6801fa3f8e4c5ca1fad2293e504c13cd3822760155963766535d1858a2b7dbb9bf40749abf3f2b77468d2baa63d18d0715bd58e1845e9d3c00270b4a9e75a";
  Encryption encrypt = Encryption();

  print(await encrypt.gcmDecryption(
      response, encrypt.rsaDecryption(encryptedKey: key)));
}

class Encryption {
  final Key randomKey = Key.fromSecureRandom(32);
  final String gcmKey = 'Clo7fFKddspe--NzCv4WjYcPtk4PkuxyO2LXgW_xImk';

  final parser = RSAKeyParser();

  /// this method is use to encrypt any jsonString using AES-GCM encryption method
  Future<String> gcmEncryption(String plainText) async {
    var cipherKey = gcmKey;
    return await Aes256Gcm.encrypt(plainText, cipherKey);
  }

  /// this method is use to decrypt the encrypted response
  /// strKey --> will get in response
  /// encrypted --> response
  Future<String> gcmDecryption(String encrypted, String strKey) async {
    return await Aes256Gcm.decrypt(encrypted, strKey);
  }

  /// this method is use to decrypt the encrypted response
  /// strKey --> will get in response
  /// encrypted --> response

 /* Future<String> rsaEncryption2({String? key}) async {
    return await FAST.RSA
        .encryptOAEP(randomKey.base64, '', FAST.Hash.SHA1, kPublicKeyPEM);
  }*/

  String rsaEncryption({String? key}) {
    final publicKey = parser.parse(kPublicKeyPEM) as RSAPublicKey;
    final encrypter =
    Encrypter(RSA(publicKey: publicKey, encoding: RSAEncoding.OAEP));
    final encrypted = encrypter.encrypt(key ?? randomKey.base64);
    final encryptedBase64 = encrypted.base64;
    return encryptedBase64;
  }

  /// this method is use to encrypt any random key by RSA
  String rsaDecryption({required String encryptedKey}) {
    final privateKey = parser.parse(kPrivateKeyPEM) as RSAPrivateKey;
    final encrypter =
    Encrypter(RSA(privateKey: privateKey, encoding: RSAEncoding.OAEP));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedKey));
    return decrypted;
  }

  /*Future<String> rsaDecryption2({required String encryptedKey}) async {
    var result = await FAST.RSA
        .decryptOAEP(encryptedKey, '', FAST.Hash.SHA1, kPrivateKeyPEM);
    return result;
  }*/
}

// void main() async {
//   final encryption = Encryption();
//
//   // 1. Simulate the original message
//   final message = {
//     "app_name": "hsh",
//     "app_description": "hh",
//     "app_version": "h",
//     "package_name": "h",
//     "category": "",
//     "developer_name": "h",
//     "release_notes": "h",
//     "privacy_policy_url": "h",
//     "website_url": "h"
//   };
//
//   final plainText = jsonEncode(message);
//
//   // 2. Encrypt the message using AES-GCM
//   final aesKey = encryption.randomKey.base64;
//   final encryptedMessage = await encryption.gcmEncryption(plainText);
//
//   // 3. Encrypt the AES key using RSA
//   final encryptedKey = encryption.rsaEncryption(key: aesKey);
//
//   // Print for testing
//   print("=== ENCRYPTION ===");
//   print("Original Message: $plainText");
//   print("Encrypted AES Key (RSA): $encryptedKey");
//   print("Encrypted Message (AES-GCM): $encryptedMessage");
//
//   // 4. Decrypt AES key using RSA
//   final decryptedAesKey = encryption.rsaDecryption(encryptedKey: encryptedKey);
//
//   // 5. Decrypt the message using decrypted AES key
//   final decryptedMessage = await encryption.gcmDecryption(encryptedMessage, decryptedAesKey);
//
//   print("\n=== DECRYPTION ===");
//   print("Decrypted AES Key: $decryptedAesKey");
//   print("Decrypted Message: $decryptedMessage");
// }
