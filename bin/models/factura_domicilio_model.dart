import 'dart:convert';

class FacturaDomicilio {
  int? rowid;
  int? rowidServicio;
  int? codFactura;
  String? tipoPedido;
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
  String? statusFacturacion;
  FacturaDomicilio(
      {this.rowid,
      this.rowidServicio,
      this.codFactura,
      this.tipoPedido,
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
      this.estatus,
      this.statusFacturacion});

  Map<String, dynamic> toMap() {
    return {
      'rowid': rowid,
      'rowid_servicio': rowidServicio,
      'codFactura': codFactura,
      'tipo_pedido': tipoPedido,
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
      'estatus': estatus,
      'statusFacturacion': statusFacturacion
    };
  }

  factory FacturaDomicilio.fromMap(Map<String, dynamic> map) {
    return FacturaDomicilio(
      rowid: map['rowid'],
      rowidServicio: map['rowid_servicio'],
      codFactura: map['codFactura'],
      tipoPedido: map['tipo_pedido'],
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
      estatus: map['estatus'],
      statusFacturacion: map['statusFacturacion'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FacturaDomicilio.fromJson(String source) =>
      FacturaDomicilio.fromMap(json.decode(source));

  factory FacturaDomicilio.fromList(List list) {
    return FacturaDomicilio(
      rowid: list[0],
      codFactura: list[1],
      send: list[2].toString(),
      nombreCliente: list[3],
      numeroTelefono: list[4],
      direccionEnvio: list[5],
      fechaHoraPedido: list[6].toString(),
      metodoPago: list[7],
      rnc: list[8],
      razonSocial: list[9],
      rncEstatus: list[10],
      subtotal: double.parse(list[11]),
      descuento: double.parse(list[12]),
      codDescuento: list[13],
      porcientoDescuento: double.parse(list[14]),
      total: double.parse(list[15]),
      productos: list[16].toString(),
      estatus: list[17],
      statusFacturacion: list[18],
    );
  }

  static List<FacturaDomicilio> facturaDomicilioFromMapList(List list) {
    var facturas = <FacturaDomicilio>[];

    for (var factura in list) {
      facturas.add(FacturaDomicilio.fromMap(factura));
    }
    return facturas;
  }

  static List<FacturaDomicilio> facturaDomiciliosFromList(List list) {
    var facturas = <FacturaDomicilio>[];

    for (var factura in list) {
      facturas.add(FacturaDomicilio.fromList(factura));
    }
    return facturas;
  }

  static String facturaDomiciliosFromListToJson(List list) {
    var facturas = facturaDomiciliosFromList(list);
    var facturasJson = [];

    for (var factura in facturas) {
      facturasJson.add(factura.toJson());
    }
    return '''
      {
        "facturas" : [
          ${facturasJson.join(',')}
        ]
      }
    ''';
  }

  @override
  String toString() {
    return 'FacturaDomicilio(rowid: $rowid, codFactura: $codFactura, send: $send, nombreCliente: $nombreCliente, numeroTelefono: $numeroTelefono, direccionEnvio: $direccionEnvio, fechaHoraPedido: $fechaHoraPedido, metodoPago: $metodoPago, rnc: $rnc, razonSocial: $razonSocial, rncEstatus: $rncEstatus, subtotal: $subtotal, descuento: $descuento, codDescuento: $codDescuento, porcientoDescuento: $porcientoDescuento, total: $total, productos: $productos, estatus: $estatus, statusFacturacion: $statusFacturacion)';
  }
}
