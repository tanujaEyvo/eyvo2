import 'package:eyvo_inventory/Environment/base_configuration.dart';

class ProductionConfiguration implements BaseConfig {
  @override
  String get apiHost => 'https://api-mobile.ebuyerassist.com/URBN-Mobile';

  @override
  String get domainHost => '';
}
