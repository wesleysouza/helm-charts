{{/* Nome base da aplicação */}}
{{- define "meu-app.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Fullname (seguindo a lógica que você enviou anteriormente) */}}
{{- define "meu-app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/* Nome do Service Stable */}}
{{- define "meu-app.stableServiceName" -}}
{{- printf "%s-stable" (include "meu-app.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Nome do Service Canary */}}
{{- define "meu-app.canaryServiceName" -}}
{{- printf "%s-canary" (include "meu-app.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end }}

{{/* Labels padrão */}}
{{- define "meu-app.labels" -}}
app.kubernetes.io/name: {{ include "meu-app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/* Seletores (usados no Rollout e Services) */}}
{{- define "meu-app.selectorLabels" -}}
app: {{ include "meu-app.name" . }}
release: {{ .Release.Name }}
{{- end }}