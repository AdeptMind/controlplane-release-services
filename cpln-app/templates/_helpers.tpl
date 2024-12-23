{{/*
Expand the name of the chart.
*/}}
{{- define "app.name" -}}
{{- default .Release.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app.chart" -}}
{{- printf "%s-%s" .Release.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "app.tags" -}}
helm.sh/chart: {{ include "app.chart" . }}
{{ include "app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.cpln.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.cpln.io/managed-by: {{ .Release.Service }}
app.mydomain.com/owner: {{ .Values.owner | quote }}
app.mydomain.com/team: {{ .Values.team | quote }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "app.selectorLabels" -}}
app.cpln.io/name: {{ include "app.name" . }}
app.cpln.io/instance: {{ .Release.Name }}
{{- end }}



{{/*
Env
*/}}
{{- define "app.env" -}}
{{- /* Generic environment variables */}}
{{- with .Values.container.env }}
{{- toYaml . }}
{{- end -}}
{{- end -}}

