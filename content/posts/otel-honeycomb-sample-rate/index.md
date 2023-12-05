---
title: "Otel Honeycomb Sample Rate"
date: 2023-11-30T15:23:55+01:00
draft: true

slug: "" 
tags: []
categories: []
---

Let's say you want to integrate Honeycomb in your Go app.
You can use the packages distributed by Honeycomb to do so.
However, if you want to try the packages provided by Open Telemetry, you can do as follows:

```
func initOTel(ctx context.Context, cfg config) (*sdktrace.TracerProvider, error) {
	// Instantiate the service resource.
	res, err := resource.Merge(
		resource.Default(),
		resource.NewWithAttributes(
			semconv.SchemaURL,
			semconv.ServiceVersion(Version),
			ServiceOwnerSquad.String(cfg.OwnerSquad),
			ServiceOwnerTribe.String(cfg.OwnerTribe),
		),
	)
	if err != nil {
		return nil, fmt.Errorf("creating resource: %w", err)
	}
	expClient := otlptracehttp.NewClient()
	exp, err := otlptrace.New(ctx, expClient)
	if err != nil {
		return nil, fmt.Errorf("creating exporter: %w", err)
	}

	sampleRatio := 1.0 / float64(cfg.OTelSampleRate)

	// The official docs recomment using a combination of ratio based sampler with parent based sampler.
	// Refer: https://opentelemetry.io/docs/instrumentation/go/sampling/
	sampler := sdktrace.ParentBased(
		sdktrace.TraceIDRatioBased(sampleRatio),
	)

	tp := sdktrace.NewTracerProvider(
		sdktrace.WithResource(res),
		sdktrace.WithSpanProcessor(NewHoneycombSpanProcessor(cfg.OTelSampleRate)),
		sdktrace.WithBatcher(exp),
		sdktrace.WithSampler(sampler),
	)
	otel.SetTracerProvider(tp)
	return tp, nil
}

type HoneycombSpanProcessor struct {
	sampleRate int
}

func NewHoneycombSpanProcessor(sampleRate int) HoneycombSpanProcessor {
	return HoneycombSpanProcessor{sampleRate: sampleRate}
}

func (sp HoneycombSpanProcessor) OnStart(parent context.Context, span sdktrace.ReadWriteSpan) {
	// Add the SampleRate attribute to every span.
	span.SetAttributes(attribute.Int("SampleRate", sp.sampleRate))
}

func (sp HoneycombSpanProcessor) OnEnd(s sdktrace.ReadOnlySpan) {}

func (sp HoneycombSpanProcessor) Shutdown(ctx context.Context) error {
	return nil
}

func (sp HoneycombSpanProcessor) ForceFlush(ctx context.Context) error {
	return nil
}
```

Apparently, Honeycomb adds an attribute to every span in it's traces with "SampleRate".

Honeycomb.io expects the attribute SampleRate in every span of the trace to handle sampled data on their side.
This is easy to miss if you chose the native approach.

So I wrote the `HoneycombSpanProcessor` to take care of this.

Ref: https://docs.honeycomb.io/manage-data-volume/sampling/#how-honeycomb-handles-sampled-data