package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

func main() {
	dataPath := filepath.Join("event_2026", "data", "q1_1.txt")

	data, err := os.ReadFile(dataPath)

	if err != nil {
		log.Fatalf("Error reading input file at %s: %v\n", dataPath, err)
		return
	}

	intInp, err := parseInput(data)

	if err != nil {
		log.Fatalf("Error parsing input from []byte to int: %v", err)
	}

	fmt.Printf("Int Input: %v", intInp)
}

func parseInput(input []byte) ([]int, error) {

	stringInp := string(input)

	var x []string

	x = strings.Split(stringInp, ",")

	var y []int

	for _, v := range x {
		z, err := strconv.Atoi(v)

		if err != nil {
			return nil, err
		}
		y = append(y, z)
	}

	return y, nil
}

//todo
//take sqrt of each input
//if there's no remainder, then return 0
//if there's a remainder, calculate y = square(ceiling(sqrt(x))), then return y-x
