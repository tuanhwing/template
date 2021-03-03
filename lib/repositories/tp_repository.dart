
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:template/core/tp_network_requester.dart';

abstract class TPRepository {
  TPRepository(BuildContext context ) {
    _requester = Provider.of<TPNetworkRequester>(context, listen: false);
  }
  TPNetworkRequester _requester;

  TPNetworkRequester get requester => _requester;
}