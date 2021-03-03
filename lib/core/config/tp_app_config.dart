
import 'package:template/core/enums/tp_eviroments.dart';

class TPAppConfig {
  //[START] App config
  static const APP_ENVIROMENT = TPEnviroments.develop;//Setting eviroment application
//[END] App config
}

const TPAPIConfig = {
  TPEnviroments.demo : 'https://demo.com.vn',
  TPEnviroments.develop : 'https://dev.com.vn',
  TPEnviroments.staging : 'https://staging.com.vn',
  TPEnviroments.production : 'https://production.com.vn',
};

