import 'package:logger/logger.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    colors: true,
    lineLength: 120,
  ),
);

logI(dynamic message) {
  logger.i(message);
}

logW(dynamic message) {
  logger.w(message);
}

logD(dynamic message) {
  logger.d(message);
}

logE(dynamic message) {
  logger.e(message);
}
