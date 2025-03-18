class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
}

class CacheException implements Exception {
  final String message;
  const CacheException({this.message = 'Cache Error'});
}

class UnimplementedException implements Exception {
  final String message;
  const UnimplementedException({this.message = 'Unimplemented Error'});
}
