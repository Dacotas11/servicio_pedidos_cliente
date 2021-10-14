import 'dart:convert';

import 'package:postgres/postgres.dart';

import '../models/pedidos_model.dart';

Future<PostgreSQLResult> sqlUtils(String sqlcmd) async {
  final conexion = PostgreSQLConnection(
      'host.docker.internal', 5432, 'base_prueba',
      username: 'postgres', password: '123');

  await conexion.open();
  final resultado = await conexion.query(sqlcmd);
  await conexion.close();
  return resultado;
}

Future<void> insertPedido(Pedido pedido) async {
  final command = """
  INSERT INTO dbo.pedidos(
    rowid,
    rowid_servicio,
    send, 
    nombre_cliente, 
    numero_telefono,
    direccion_envio, 
    fecha_hora_pedido, 
    metodo_pago, 
    rnc,
    razon_social, 
    rnc_estatus,
    subtotal, 
    descuento,
    cod_descuento,
    porciento_descuento,
    total,
    productos,
    estatus,
    status_facturacion
    ) VALUES(
      ${pedido.rowidServicio}
      ${pedido.rowidServicio},
      '${pedido.send}',
      '${pedido.nombreCliente}',
      '${pedido.numeroTelefono}',
      '${pedido.direccionEnvio}',
      '${pedido.fechaHoraPedido}',
      '${pedido.metodoPago}',
      ${pedido.insertRnc()},
      ${pedido.insertRazonSocial()},
      ${pedido.insertRncEstatus()},
      ${pedido.subtotal},
      ${pedido.descuento},
      ${pedido.insertCodigoDescuento()},
      ${pedido.porcientoDescuento},
      ${pedido.total},
      '${pedido.productos}',
      'PROCESADA',
      'PENDIENTE'
    );
  """;
  // print(command);
  await sqlUtils(command);
}

Future<void> insertListPedidos(List<Pedido> list) async {
  for (var pedido in list) {
    await insertPedido(pedido);
  }
}

bool hasFacturas(String jsonString) {
  final facturas = json.decode(jsonString);
  final facturasList = facturas['facturas'] as List;

  if (facturasList.isNotEmpty) {
    return true;
  } else {
    return false;
  }
}
