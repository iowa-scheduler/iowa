package main

import (
	"reflect"
	"testing"
)

func Test_Version(t *testing.T) {
	if reflect.TypeOf(Version).String() != "string" {
		t.Error("Version should be a string")
	}
}
