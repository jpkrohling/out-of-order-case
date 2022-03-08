FROM otel/opentelemetry-collector:0.46.0
COPY otel-collector-configmap.yaml /etc/otelcol/config.yaml
