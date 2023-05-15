import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProviderB = FutureProvider<String>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  
  return 'futureProviderB';
});
