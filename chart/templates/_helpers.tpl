{{/*
Expand the name of the chart.
*/}}
{{- define "kafka-exporter.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kafka-exporter.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" $name .Release.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kafka-exporter.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kafka-exporter.labels" -}}
{{ include "kafka-exporter.selectorLabels" . }}
{{- if eq .Values.managedByHelm true }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "kafka-exporter.chart" . }}
{{- end }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kafka-exporter-gendis.labels" -}}
{{ include "kafka-exporter-gendis.selectorLabels" . }}
{{- if eq .Values.managedByHelm true }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "kafka-exporter.chart" . }}
{{- end }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kafka-exporter.selectorLabels" -}}
app: {{ include "kafka-exporter.fullname" . }}
app.kubernetes.io/name: {{ include "kafka-exporter.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels gendis
*/}}
{{- define "kafka-exporter-gendis.selectorLabels" -}}
app: {{ include "kafka-exporter.fullname" . }}-gendis
app.kubernetes.io/name: {{ include "kafka-exporter.name" . }}-gendis
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "kafka-exporter.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "kafka-exporter.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "kafka-exporter-gendis.serviceAccountName" -}}
{{- if .Values.gendis.serviceAccount.create }}
{{- default (include "kafka-exporter-gendis.fullname" .) .Values.gendis.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.gendis.serviceAccount.name }}
{{- end }}
{{- end }}