package main

import (
	"net/http"
    "fmt"
    "log"

	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promauto"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

var (
	opsProcessed = promauto.NewCounter(prometheus.CounterOpts{
		Name: "myapp:processed_ops_total",
		Help: "The total number of processed events",
	})
)

func main() {
	http.Handle("/metrics", promhttp.Handler())
    http.HandleFunc("/home/", func (w http.ResponseWriter, r *http.Request) {
        opsProcessed.Inc()
        fmt.Fprintf(w, "Hello, you´ve requested: %s\n", r.URL.Path)
    })
	log.Fatal(http.ListenAndServe(":2112", nil))

}
