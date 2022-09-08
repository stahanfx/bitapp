package main

import (
	"encoding/json"
	"log"
	"strconv"

	"github.com/nats-io/nats.go"
)

type Order struct {
	OrderID    int
	CustomerID string
	Status     string
}

const (
	streamName     = "ORDERS"
	streamSubjects = "ORDERS.*"
	subjectName    = "ORDERS.create"
)

func main() {
	// Connect to NATS
	nc, _ := nats.Connect(nats.DefaultURL)
	// Creates JetStreamContext
	js, err := nc.JetStream()
	checkErr(err)
	// Creates stream
	err = createStream(js)
	checkErr(err)
	// Create orders by publishing messages
	err = createOrder(js)
	checkErr(err)
}

// createOrder публикует поток событий
// с темой "ORDERS.created"
func createOrder(js nats.JetStreamContext) error {
	var order Order
	for i := 1; i <= 10; i++ {
		order = Order{
			OrderID:    i,
			CustomerID: "Цена-" + strconv.Itoa(i),
			Status:     "create",
		}
		orderJSON, _ := json.Marshal(order)
		_, err := js.Publish(subjectName, orderJSON)
		if err != nil {
			return err
		}
		log.Printf("Заказа с ID:%d отправлен адресату\n", i)
	}
	return nil
}

// createStream создает поток с помощью JetStreamContext
func createStream(js nats.JetStreamContext) error {
	// Проверьте, существует ли уже поток ORDERS; если нет, создайте его.
	stream, err := js.StreamInfo(streamName)
	if err != nil {
		log.Println(err)
	}
	if stream == nil {
		log.Printf("создан стим %q и субьекты %q", streamName, streamSubjects)
		_, err = js.AddStream(&nats.StreamConfig{
			Name:     streamName,
			Subjects: []string{streamSubjects},
		})
		if err != nil {
			return err
		}
	}
	return nil
}

func checkErr(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
