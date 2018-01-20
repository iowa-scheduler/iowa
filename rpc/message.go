package rpc

import (
	"io"

	proto "github.com/iowa-scheduler/iowa/proto"
	"github.com/iowa-scheduler/iowa/utils"
	"golang.org/x/net/context"
	"google.golang.org/grpc/metadata"
)

// Message Message gRPC Service Definition
type Message struct{}

// Auth Receive authentication
func (srv *Message) Auth(ctx context.Context, in *proto.AuthRequest) (*proto.AuthResponse, error) {
	// TODO: not implemented
	return &proto.AuthResponse{
		Token: "test",
	}, nil
}

// Done Worker has finished the work
func (srv *Message) Done(ctx context.Context, in *proto.TaskDone) (*proto.Empty, error) {
	_, ok := metadata.FromIncomingContext(ctx)
	if ok == false {
		return &proto.Empty{}, utils.ErrAuthFailed
	}
	// TODO: not implemented
	return &proto.Empty{}, nil
}

// Register Register worker
func (srv *Message) Register(stream proto.Message_RegisterServer) error {
	_, ok := metadata.FromIncomingContext(stream.Context())
	if ok == false {
		return utils.ErrAuthFailed
	}
	// TODO: not implemented
	for {
		_, err := stream.Recv()
		if err != io.EOF {
			// TODO: Recycle resource
			// Close the connection
			return err
		}
	}
}
