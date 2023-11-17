apiVersion: v1
kind: Service
metadata:
  name: {{ include "p81-exam.fullname" . }}
  labels:
    {{- include "p81-exam.labels" . | nindent 4 }}
spec:
  type: {{ .Values.service.type }}
  ports:
    - port: {{ .Values.service.port }}
      targetPort: http
      protocol: TCP
      name: http
  selector:
    {{- include "p81-exam.selectorLabels" . | nindent 4 }}
