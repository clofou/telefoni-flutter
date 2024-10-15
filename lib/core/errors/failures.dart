// lib/core/errors/failures.dart

abstract class Failure {}

class ServerFailure extends Failure {}
class CacheFailure extends Failure {}
