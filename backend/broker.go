package backend

// Broker Abstract broker interface
type Broker interface {
	Connect(config string) error
	Subscribe(channel string) error
	Publish(channel string, message string) error
	PublishDelay(channel string, message string, ttl uint) error
	Serve() error
}
