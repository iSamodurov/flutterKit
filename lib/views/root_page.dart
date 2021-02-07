import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutterKit/mixins/loader_mixin.dart';
import 'package:flutterKit/ui/helpers/custom_overlay.dart';
import 'package:flutterKit/ui/modals/lost_connection_overlay.dart';
import 'package:flutterKit/views/preloader/preloader_screen.dart';
import 'package:flutter_translate/flutter_translate.dart';


class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}



class _RootPageState extends State<RootPage> with Loading {
  StreamSubscription<ConnectivityResult> connectionStream;
  CustomOverlay alertOverlay;

  void _createConnectionAlertModal(BuildContext context) {
    alertOverlay = CustomOverlay(
      context: context,
      child: LostConnectionOverlay(),
    );
  }

  void _onConnectionChange(BuildContext context, ConnectivityResult connection) {
    bool _connected = (connection != ConnectivityResult.none);
    if (!_connected) {
      alertOverlay.show();
    } else {
      alertOverlay.hide();
    }
  }

  void _checkConnectionOnInit(BuildContext context) async {
    var connection = await (Connectivity().checkConnectivity());
    _onConnectionChange(context, connection);
  }

  void _listenConnection(BuildContext context) {
    connectionStream = Connectivity().onConnectivityChanged.listen((ConnectivityResult connection) {
      _onConnectionChange(context, connection);
    });
  }


  @override
  void initState() {
    setLoading(true);
    super.initState();
    _createConnectionAlertModal(context);
    _checkConnectionOnInit(context);
    _listenConnection(context);

    // TODO: Remove demo code
    Future.delayed(Duration(seconds: 3), () {
      setLoading(false);
    });
  }


  @override
  Widget build(BuildContext context) {
    if (loading) return PreloaderScreen();
    return Scaffold(
      appBar: AppBar(title: Text(translate('app_name'))),
      body: Container(),
    );
  }


  @override
  void dispose() {
    super.dispose();
    connectionStream.cancel();
  }
}
