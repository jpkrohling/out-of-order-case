package main

import (
	"log"
	"net/http"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func main() {
	taskCounter := prometheus.NewCounter(prometheus.CounterOpts{
		Subsystem: "worker_pool",
		Name:      "completed_tasks_total",
		Help:      "Total number of tasks completed.",
	})
	prometheus.MustRegister(taskCounter)

	taskCounter.Inc()

	http.Handle("/metrics", promhttp.Handler())
	log.Println("Ready")
	if err := http.ListenAndServe(":3000", nil); err != nil {
		log.Fatal(err)
	}
}
