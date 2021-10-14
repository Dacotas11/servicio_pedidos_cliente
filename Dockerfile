FROM google/dart-runtime

RUN pub get

ENTRYPOINT ["/usr/bin/dart", "bin/servicio_pedidos_cliente.dart"]
