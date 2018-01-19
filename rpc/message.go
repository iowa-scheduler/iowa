package rpc

import (
	proto "github.com/iowa-scheduler/iowa/proto"
	"golang.org/x/net/context"
)

// Message Message gRPC Service Definition
type Message struct{}

// Auth Receive authentication
func (srv *Message) Auth(ctx context.Context, in *proto.AuthRequest) (*proto.AuthResponse, error) {
	return &proto.AuthResponse{
		Id:    "123",
		Token: "test",
	}, nil
}
