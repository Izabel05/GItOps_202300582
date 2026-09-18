{{- define "rabbitmq.fullname" -}}{{ default .Chart.Name .Values.fullnameOverride }}{{- end }}
{{- define "rabbitmq.namespace" -}}
{{- if .Values.global -}}
{{ .Values.global.namespace | default .Release.Namespace }}
{{- else -}}
{{ .Release.Namespace }}
{{- end -}}
{{- end }}
