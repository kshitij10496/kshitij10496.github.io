---
title: "Otel Http Request Headers"
date: 2023-11-30T15:32:50+01:00
draft: true

slug: "" 
tags: []
categories: []
---

# Problem
- Get observability into the headers set on the incoming HTTP request to the OpenTelemetry span. For example, we would like to associate data across User-Agents, Geo Locations.

# Solution

It turns out this problem is rather more common that I first thought.
The `httpconv` package provides a helper according to the OpenTelemetry standard.

One approach I wrote was to write a middleware to set relevant headers KV pairs to the span as as attributes.


```go
func OTelMiddleware(filterHeaders []string) func(next http.Handler) http.Handler {
	return func(next http.Handler) http.Handler {
		return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
			ctx := r.Context()

			// Build KV pairs of OTel span attributes from the request headers.
			headers := httpconv.RequestHeader(r.Header)

			// Apply filter for sensitive headers.
			for _, h := range filterHeaders {
				for _, attr := range headers {
					if attr.Key() == h {

						attrs = filterHeaders(header)
					}
				}
			}

			// Add request headers to the current span.
			span := trace.SpanFromContext(ctx)
			span.SetAttributes(attrs...)

			next.ServeHTTP(w, r)
		})
	}
}
```

Ref: https://pkg.go.dev/go.opentelemetry.io/otel@v1.16.0/semconv/v1.20.0/httpconv#RequestHeader