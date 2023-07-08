import 'package:structured_todo/config/routes/endpoint_config.dart';
import 'package:get/get.dart';

class EndpointService extends GetxService {
  static EndpointService get to => Get.find();

  Uri getPrefixedUri(path, [queryParameters]) {
    if (ToDoEndpointConfiguration.httpSchema == 'https') {
      return Uri.https(
        ToDoEndpointConfiguration.domain,
        ToDoEndpointConfiguration.prefix + path,
        queryParameters,
      );
    } else {
      return Uri.http(
          ToDoEndpointConfiguration.domain,
          ToDoEndpointConfiguration.prefix + path,
          queryParameters
      );
    }
  }
}