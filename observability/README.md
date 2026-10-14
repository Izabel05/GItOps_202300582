# Observabilidad

Estas aplicaciones son gestionadas por Argo CD desde `argocd/applications` y se ejecutan en el clúster GKE de P9, dentro del namespace `observability`.

## Componentes

- `kube-prometheus-stack` instala Prometheus, Alertmanager, kube-state-metrics, node-exporter y Grafana.
- `loki` almacena logs en un volumen persistente de GKE en modo monolítico, apropiado para el tamaño actual del entorno.
- `tempo` almacena trazas en un volumen persistente de GKE y habilita receptores OTLP y Jaeger.

Grafana se provisiona con Prometheus como fuente predeterminada y con Loki y Tempo como fuentes adicionales. Todos los servicios permanecen internos al clúster mediante `ClusterIP`; la exposición externa debe hacerse mediante los mecanismos de ingreso definidos para el entorno.

Las capacidades de persistencia usan PersistentVolumeClaims, por lo que los datos quedan en discos persistentes administrados por Google Cloud y no en el equipo local. Las versiones de los charts están fijadas en cada `Application` para que los cambios lleguen mediante commits controlados.

La recolección de logs y trazas desde las aplicaciones (por ejemplo, Grafana Alloy u OpenTelemetry Collector) se puede añadir como una etapa posterior; estos manifiestos dejan listas las APIs de almacenamiento y consulta.
