package main

import (
	"fmt"
	"log"
	"net"

	proto "github.com/iowa-scheduler/iowa/proto"
	"github.com/iowa-scheduler/iowa/rpc"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

// Version iowa version
const Version = "0.0.1"
const port = ":50051"

func main() {
	fmt.Print("Hello Iowa")
	lis, err := net.Listen("tcp", port)
	if err != nil {
		log.Fatalf("failed to listen: %v", err)
	}
	srv := grpc.NewServer()
	proto.RegisterMessageServer(srv, &rpc.Message{})
	reflection.Register(srv)
	if err := srv.Serve(lis); err != nil {
		log.Fatalf("failed to serve: %v", err)
	}
}
