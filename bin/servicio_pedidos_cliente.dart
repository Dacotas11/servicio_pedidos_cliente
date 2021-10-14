import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'controllers/db_controller.dart';
import 'models/factura_domicilio_model.dart';
import 'models/pedidos_model.dart';

Future<void> main(List<String> arguments) async {
  final duration = Duration(seconds: 10);
  print('Servicio Iniciado');

  Timer.periodic(duration, (timer) async {
    final responseGet = await http.get(
        Uri.parse('http://18.116.59.196:4040/facturas_domicilio/noprocesadas'));

    if (hasFacturas(responseGet.body)) {
      print(DateTime.now());
      final jsonBody = json.decode(responseGet.body);
      final facturas =
          FacturaDomicilio.facturaDomicilioFromMapList(jsonBody['facturas']);
      print('${facturas.isEmpty ? facturas : facturas.length}');

      final pedidos = Pedido.pedidoFromFacturaDomicilioList(facturas);

      await insertListPedidos(pedidos);
      // print(json.encode({
      //   'id': [37, 50]
      // }));

      final responsePost = await http.post(
        Uri.parse('http://18.116.59.196:4040/facturas_domicilio/procesar'),
        body: '{"id" : ${Pedido.getIdFromList(pedidos)}}',
      );

      print(responsePost.body);
    }
  });
}
