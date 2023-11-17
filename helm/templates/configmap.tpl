apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "p81-exam.fullname" . }}-index-html
  labels:
    {{- include "p81-exam.labels" . | nindent 4 }}
data:
{{ (.Files.Glob "index.html").AsConfig | indent 2 }}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "p81-exam.fullname" . }}-env-vars
  labels:
    {{- include "p81-exam.labels" . | nindent 4 }}
data:
  APP_ENVIRONMENT: {{ .Values.appEnvironment | quote }}
