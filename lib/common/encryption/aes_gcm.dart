// import 'dart:convert';
// import 'dart:math';
// import 'dart:typed_data';
//
// import 'package:cryptography/cryptography.dart';
//
// import '../utils/constants/key_constants.dart';
//
// class AesGcmEncryption {
//   static const int ivLengthByte = 12;
//   static const int tagLengthBit = 128;
//
//   // Base64 Encode
//   static String base64encrypt(String plainText) {
//     return base64.encode(utf8.encode(plainText));
//   }
//
//   // Base64 Decode
//   static String base64decrypt(String encryptedText) {
//     return utf8.decode(base64.decode(encryptedText));
//   }
//
//   // Encrypt the given plaintext
//   static Future<String> encrypt(String plainText) async {
//     final secretKey = await _getSecretKeyFromBase64(KeyConstants.masterKey);
//     final iv = _generateRandomBytes(ivLengthByte);
//
//     final algorithm = AesGcm.with256bits();
//
//     final secretBox = await algorithm.encrypt(
//       utf8.encode(plainText),
//       secretKey: secretKey,
//       nonce: iv,
//     );
//
//     // Concatenate IV + CipherText + MAC
//     final encryptedBytes =
//         Uint8List.fromList(iv + secretBox.cipherText + secretBox.mac.bytes);
//
//     return _bytesToHex(encryptedBytes);
//   }
//
//   // Decrypt the given encrypted text
//   static Future<String> decrypt(String encryptedHex) async {
//     final secretKey = await _getSecretKeyFromBase64(KeyConstants.masterKey);
//     final encryptedBytes = _hexToBytes(encryptedHex);
//
//     // Extract IV, CipherText, and MAC
//     final iv = encryptedBytes.sublist(0, ivLengthByte);
//     final cipherText =
//         encryptedBytes.sublist(ivLengthByte, encryptedBytes.length - 16);
//     final mac = encryptedBytes.sublist(encryptedBytes.length - 16);
//
//     final algorithm = AesGcm.with256bits();
//
//     final secretBox = SecretBox(
//       cipherText,
//       nonce: iv,
//       mac: Mac(mac),
//     );
//
//     final decryptedBytes = await algorithm.decrypt(
//       secretBox,
//       secretKey: secretKey,
//     );
//
//     return utf8.decode(decryptedBytes);
//   }
//
//   // Get SecretKey from Base64 Key String
//   static Future<SecretKey> _getSecretKeyFromBase64(String base64Key) async {
//     final keyBytes = base64.decode(base64Key);
//     return SecretKey(keyBytes);
//   }
//
//   // Generate random bytes for IV
//   static Uint8List _generateRandomBytes(int length) {
//     final random = Random.secure();
//     return Uint8List.fromList(
//         List<int>.generate(length, (i) => random.nextInt(256)));
//   }
//
//   // Convert bytes to hex string
//   static String _bytesToHex(Uint8List bytes) {
//     return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
//   }
//
//   // Convert hex string to bytes
//   static Uint8List _hexToBytes(String hex) {
//     final result = Uint8List(hex.length ~/ 2);
//     for (int i = 0; i < hex.length; i += 2) {
//       result[i ~/ 2] = int.parse(hex.substring(i, i + 2), radix: 16);
//     }
//     return result;
//   }
// }
//
// Future<void> main() async {
//   const plainText = '{"serviceId":1,"categoryList" :[1,2]}';
//   // Encrypt
//   final encrypted = await AesGcmEncryption.encrypt(plainText);
//   print("Encrypted: $encrypted");
//
//   // Decrypt
//   final decrypted = await AesGcmEncryption.decrypt(
//       "aad540cdfcf0763d3555a78737cbeb2c64daf9d3bab429f832aa7a1e4f6c9009b69d40638f29a5f014c11f4382af1da1491ab8d85c601ef66dbabff9edf1a5598af89c946907c48159d5ea30d233a3469a30586c06dde9e62c35b7062ab808aab9ffb2ef8ce3e5e2158a9e50972092a813ce364d74ac16cfa6f8257d3ef6ce705766729aae0314f02cd44f64388aa45977b10698f666b6eb8e79e59413360a815c46b449306382636c584af9a4983572989ed4c7903e23dd94d52f5d7b98a777c927a3a697e605c887ea5a2767d414b47fe0d3667720f70a255a7caeadedd96105ad92fb8e833c458ae2608de5314162b3753acf221d8202281e1e31dedd3aef35329c826d22059df345f2fe37812a6e11d899013fcae24dcc04a3b24379b4ffe581c38fa4768727247c46bad7323550454f6621625ea87a867f1ee3747d8c3c1f416f52f3409e1f8a80bee657633721ae4e92bac1c7130435baddde90d659b38830d822a58f437f3192ea28e61d119dc9526e8e9e466303e5958b1bb6bab9fa81bbb03811e12ab8b2f3a65b4a7122789c1e9c4bb69772c1c8b2a817ed5fab8f07072e4605310bd73373b4cac63868e3bbf2d557f102f6e600cf7b812f34066cbae35ade6bf6780c614cffe0a80616b036873690e1df8d8f0d0e36058e559aac024f95d5cfda3997935ec2e3639b307aecde646c266aa88235bb04499dab241e801908714689d280e967cc5641c1e8c2c1fe639190f2b6bef3ed561ed6bb3ee6119dd53185a6c63f4f1d460f3d11f6ceb1d02de15f5c7de86fe9b4598cfb5d1f64f1544d278634fd33ea85f5738bf201080dcdea23e0a2e74de88358f62688c0f95e902f96f87ce5a02cf068a2b057a1d57d8584887dd1d88709528423607a24c8ddd75e45db27f37f959fd6870435abec8a5ae735155528d12a1f5ae6901d10c3d67cd2ebd5ffa41f10fe41fef36ac09efce0d8157ee8e62007d5a7ce21359e5cf2a57855bacf8e0a574b8b9611babd5db5581666d98331ed64825c112e4f8b2739370fed953df022823bf483da6d401a9a29fdfe17fbedc3bb7068235b179e804528cb3eabf79f3172f7372e938671ee4b34e0fb656cc3f08830248389e63021771cb82e73d7c38a7995c8fb0ba4e0617ade8c9a7e599d054bc030b462633bbaf701696423367cb0f70fde3822f93b8e9ef24ef8800e0fd20f70e736f2007ecbbaee48544fd03ec1ec67fb896a54084f0eb6ad50b3b4db6a750b3135ffe782c6fa897d2c8f46044dbe8cc9f08b3de429b0ef86919431565663181dbbe961f9db285e22624919b76a68e4471c6090dd05550f7f8cd20c931d8e8952ebc914aef7d2f8fe4005631a1527285d1995cf190463a42907359d6ce06b047e855f57e963a136e067b454c6ba56df2869366b47bcabd5edf0e2b227299b2ff173302f3e3e3146096bf2a6d88e304a70cc618f76c771ef9e9f151ad5dbac89852e7dd55e255c7298c8f0c7a4ac18cadf0338fdb9c7d1aa0c40709411961cc6ff5bb07dd5ab01aa6d05d95ff16502aabcca5ba3ba52376eab9e7a474d1d5e0d91bb3e57c9db3498c73ff639aaee02d3389a51ecedf4cec7fd269ae190d7345d9e680de9fa37eb4ac3a2aa490122d5e7dd4d392b0f40f6e9d377ad8b40c449a78d9aad7b3b78fcd6b83e39d59333143a5fbbf33d4f39fe8808a035ab1782b7fb14822c648b336c9fb74e982e4e0e3f780facedec45ab7a010d5dfe1c265d717eec1a0d09a2462706776827760360f93de633dcfac56f1ed1dc19cb26e60110fb7972bfb661dff095471fbec9e09236f5b6f02dfb0c6b9d4287b45c2f9f2b29422149bc215449e4298a654266ede0377d688972a0e5ac1a6844b8616c1c3127b99f4aa4d68260d7ecc8e5bc949f146b1f49aefc9f6efa9e7de55e614590ad7edc4ecab19bd027f142ca3eb91355b1313284aa9e0042af3d07e3c26211b6430cd1a5dd7de4b62ed9535ef3c939a095a4963b483b09a6d61f22184d27c3df8fb47909808a16c28f0765d85992");
//   print("Decrypted: $decrypted");
// }
