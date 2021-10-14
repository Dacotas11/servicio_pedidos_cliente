import 'dart:convert';

import 'factura_domicilio_model.dart';

class Pedido {
  int? rowid;
  int? rowidServicio;
  int? codFactura;
  String? send;
  String? nombreCliente;
  String? numeroTelefono;
  String? direccionEnvio;
  String? fechaHoraPedido;
  String? metodoPago;
  String? rnc;
  String? razonSocial;
  String? rncEstatus;
  double? subtotal;
  double? descuento;
  String? codDescuento;
  double? porcientoDescuento;
  double? total;
  String? productos;
  String? estatus;
  Pedido(
      {this.rowid,
      this.rowidServicio,
      this.codFactura,
      this.send,
      this.nombreCliente,
      this.numeroTelefono,
      this.direccionEnvio,
      this.fechaHoraPedido,
      this.metodoPago,
      this.rnc,
      this.razonSocial,
      this.rncEstatus,
      this.subtotal,
      this.descuento,
      this.codDescuento,
      this.porcientoDescuento,
      this.total,
      this.productos,
      this.estatus});

  Map<String, dynamic> toMap() {
    return {
      'rowid': rowid,
      'rowidServicio': rowidServicio,
      'codFactura': codFactura,
      'send': send,
      'nombreCliente': nombreCliente,
      'numeroTelefono': numeroTelefono,
      'direccionEnvio': direccionEnvio,
      'fechaHoraPedido': fechaHoraPedido,
      'metodoPago': metodoPago,
      'rnc': rnc,
      'razonSocial': razonSocial,
      'rncEstatus': rncEstatus,
      'subtotal': subtotal,
      'descuento': descuento,
      'codDescuento': codDescuento,
      'porcientoDescuento': porcientoDescuento,
      'total': total,
      'productos': productos,
      'estatus': estatus
    };
  }

  factory Pedido.fromMap(Map<String, dynamic> map) {
    return Pedido(
        rowid: map['rowid'],
        rowidServicio: map['rowidServicio'],
        codFactura: map['codFactura'],
        send: map['send'],
        nombreCliente: map['nombreCliente'],
        numeroTelefono: map['numeroTelefono'],
        direccionEnvio: map['direccionEnvio'],
        fechaHoraPedido: map['fechaHoraPedido'],
        metodoPago: map['metodoPago'],
        rnc: map['rnc'],
        razonSocial: map['razonSocial'],
        rncEstatus: map['rncEstatus'],
        subtotal: map['subtotal'],
        descuento: map['descuento'],
        codDescuento: map['codDescuento'],
        porcientoDescuento: map['porcientoDescuento'],
        total: map['total'],
        productos: map['productos'],
        estatus: map['estatus']);
  }

  String toJson() => json.encode(toMap());

  factory Pedido.fromJson(String source) => Pedido.fromMap(json.decode(source));

  factory Pedido.fromList(List list) {
    return Pedido(
        rowid: list[0],
        rowidServicio: list[1],
        codFactura: list[2],
        send: list[3].toString(),
        nombreCliente: list[4],
        numeroTelefono: list[5],
        direccionEnvio: list[6],
        fechaHoraPedido: list[7].toString(),
        metodoPago: list[8],
        rnc: list[9],
        razonSocial: list[10],
        rncEstatus: list[11],
        subtotal: double.parse(list[12]),
        descuento: double.parse(list[13]),
        codDescuento: list[14],
        porcientoDescuento: double.parse(list[15]),
        total: double.parse(list[16]),
        productos: list[17].toString(),
        estatus: list[18]);
  }

  factory Pedido.fromFacturaDomicilio(FacturaDomicilio factura) {
    return Pedido(
      rowidServicio: factura.rowid,
      codFactura: factura.codFactura,
      send: factura.send,
      nombreCliente: factura.nombreCliente,
      numeroTelefono: factura.numeroTelefono,
      direccionEnvio: factura.direccionEnvio,
      fechaHoraPedido: factura.fechaHoraPedido,
      metodoPago: factura.metodoPago,
      rnc: factura.rnc,
      razonSocial: factura.razonSocial,
      rncEstatus: factura.rncEstatus,
      subtotal: factura.subtotal,
      descuento: factura.descuento,
      codDescuento: factura.codDescuento,
      porcientoDescuento: factura.porcientoDescuento,
      total: factura.total,
      productos: factura.productos,
      estatus: factura.estatus,
    );
  }

  static List<Pedido> pedidoFromFacturaDomicilioList(
      List<FacturaDomicilio> list) {
    final pedidos = <Pedido>[];
    for (var factura in list) {
      pedidos.add(Pedido.fromFacturaDomicilio(factura));
    }
    return pedidos;
  }

  static List<Pedido> pedidoFromMapList(List list) {
    var pedidos = <Pedido>[];

    for (var pedido in list) {
      pedidos.add(Pedido.fromMap(pedido));
    }
    return pedidos;
  }

  static List<Pedido> pedidosFromList(List list) {
    var pedidos = <Pedido>[];

    for (var pedido in list) {
      pedidos.add(Pedido.fromList(pedido));
    }
    return pedidos;
  }

  static String pedidosFromListToJson(List list) {
    var pedidos = pedidosFromList(list);
    var pedidosJson = [];

    for (var pedido in pedidos) {
      pedidosJson.add(pedido.toJson());
    }
    return '''
      {
        "facturas" : [
          ${pedidosJson.join(',')}
        ]
      }
    ''';
  }

  bool hasRnc() {
    if (rnc != null && rnc != '') {
      return true;
    } else {
      return false;
    }
  }

  String insertRnc() {
    if (hasRnc()) {
      return "'$rnc'";
    } else {
      return 'null';
    }
  }

  bool hasRazonSocial() {
    if (razonSocial != null && razonSocial != '') {
      return true;
    } else {
      return false;
    }
  }

  String insertRazonSocial() {
    if (hasRazonSocial()) {
      return "'$razonSocial'";
    } else {
      return 'null';
    }
  }

  bool hasCodigoDescuento() {
    if (codDescuento != null && codDescuento != '') {
      return true;
    } else {
      return false;
    }
  }

  String insertCodigoDescuento() {
    if (hasCodigoDescuento()) {
      return "'$codDescuento'";
    } else {
      return 'null';
    }
  }

  String insertRncEstatus() {
    if (hasRnc()) {
      return "'$rncEstatus'";
    } else {
      return 'null';
    }
  }

  bool hasFechaHoraPedido() {
    if (fechaHoraPedido != null && fechaHoraPedido != '') {
      return true;
    } else {
      return false;
    }
  }

  String insertFechaHoraPedido() {
    if (hasFechaHoraPedido()) {
      final listaFechaInicial = fechaHoraPedido!.split(' ');
      final listaFechaFinal = listaFechaInicial[0].split('/');
      final lista = [];
      var x = 2;
      while (x >= 0) {
        lista.add(listaFechaFinal[x]);
        x -= 1;
      }
      return "'${lista.join('-')} ${listaFechaInicial.last}'";
    } else {
      return 'null';
    }
  }

  static List<int> getIdFromList(List<Pedido> list) {
    final ids = <int>[];
    for (var pedido in list) {
      ids.add(pedido.rowidServicio!);
    }
    return ids;
  }

  @override
  String toString() {
    return 'Pedido(rowid: $rowid, rowidServicio: $rowidServicio, codFactura: $codFactura, send: $send, nombreCliente: $nombreCliente, direccionEnvio: $direccionEnvio, fechaHoraPedido: $fechaHoraPedido, metodoPago: $metodoPago, rnc: $rnc, razonSocial: $razonSocial, rncEstatus: $rncEstatus, subtotal: $subtotal, descuento: $descuento, codDescuento: $codDescuento, porcientoDescuento: $porcientoDescuento, total: $total, productos: $productos)';
  }
}
