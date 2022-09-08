package main

import (
	"encoding/json"
	"github.com/nats-io/nats.go"
	"log"
)

type Order struct {
	OrderID    int
	CustomerID string
	Status     string
}

const (
	subSubjectName = "ORDERS.create"
	pubSubjectName = "ORDERS.completed"
)

func main() {
	// Connect to NATS
	nc, _ := nats.Connect(nats.DefaultURL)
	js, err := nc.JetStream()
	if err != nil {
		log.Fatal(err)
	}
	// Create Pull based consumer with maximum 128 inflight.
	// PullMaxWaiting defines the max inflight pull requests.
	sub, _ := js.PullSubscribe(subSubjectName, "new", nats.PullMaxWaiting(128))
	//ctx, cancel := context.WithTimeout(context.Background(), 30*time.Second)
	//defer cancel()

	for {
		msgs, _ := sub.Fetch(12)
		for _, msg := range msgs {
			msg.Ack()
			var order Order
			err := json.Unmarshal(msg.Data, &order)
			if err != nil {
				log.Fatal(err)
			}
			log.Println("создан service")
			log.Printf("ID заказа:%d, Клиент ID: %s, Статус :%s\n", order.OrderID, order.CustomerID, order.Status)
			reviewOrder(js, order)
		}
	}
}

// reviewOrder просматривает заказ и публикует событие ORDERS.approved
func reviewOrder(js nats.JetStreamContext, order Order) {
	// Changing the Order status
	order.Status = "выполнен"
	orderJSON, _ := json.Marshal(order)
	_, err := js.Publish(pubSubjectName, orderJSON)
	if err != nil {
		log.Fatal(err)
	}
	log.Printf("Order with OrderID:%d has been %s\n", order.OrderID, order.Status)
}
