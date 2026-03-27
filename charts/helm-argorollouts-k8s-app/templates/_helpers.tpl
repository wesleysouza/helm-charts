{{/* Expand the name of the chart. */}}
{{- define "argorollouts-k8s-app.name" -}}
{{- default .Chart.Name.Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Create a default fully qualified app name. */}}
{{- define "argorollouts-k8s-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}