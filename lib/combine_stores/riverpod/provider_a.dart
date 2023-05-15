import 'package:flutter_riverpod/flutter_riverpod.dart';

final futureProviderA = FutureProvider<String>((ref) async {
  await Future.delayed(const Duration(seconds: 2));
  
  return 'futureProviderA';
});
