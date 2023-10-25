package main

import (
	"fmt"
	"log"
	"os/exec"
)

func main() {
	prompts := []string{
		"-f ~/.cowfiles/finn-and-jake.cow 'you are \"sed\"istic'",
		"-f ~/.cowfiles/alfred.cow 'Welcome home, sir. Shall I fetch the runbook?'",
		"-f ~/.cowfiles/sparrow.cow '200?'",
		"-f ~/.cowfiles/walter.cow 'I am the one who awks'",
	}

	for _, prompt := range prompts {
		cmd := exec.Command("cowsay", prompt)
		out, err := cmd.Output()
		if err != nil {
			log.Fatal(err)
		}
		fmt.Println(string(out))
	}
}
