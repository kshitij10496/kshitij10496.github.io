---
title: "Otel Http Request Headers"
date: 2023-11-30T15:32:50+01:00
draft: true

slug: "" 
tags: []
categories: []
---

Say you would like to add an HTTP request's incoming headers to your OTel span as attributes.

```
func OTelMiddleware() func(next http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			ctx := r.Context()

			// Add request headers to the current span.
			attrs := httpconv.RequestHeader(r.Header)
			span := trace.SpanFromContext(ctx)
			span.SetAttributes(attrs...)

			next.ServeHTTP(w, r)
		})
	}
}
```

Ref: https://pkg.go.dev/go.opentelemetry.io/otel@v1.16.0/semconv/v1.20.0/httpconv#RequestHeader