package main

import (
	"fmt"
	"log"
	"math"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

func main() {

	dataPath := filepath.Join("event_2026", "data", "q1_1.txt")

	p1, err := solveP1(dataPath)

	if err != nil {
		log.Fatalf("Error solving part 1: %v\n", err)
	}

	fmt.Printf("Part 1 Solution: %v", p1)
}

// parse input from a slice of bytes into a slice of ints
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

// calculate the number of additional pinecones needed per outpost
func morePinecones(x []int) ([]int, error) {

	var r []int

	for _, v := range x {
		z := float64(v)
		zsqrt := math.Sqrt(z)
		zFloor := math.Floor(zsqrt)

		if zsqrt == zFloor {
			r = append(r, 0)

		} else {
			y := math.Pow(math.Ceil(zsqrt), 2)
			d := y - z
			r = append(r, int(d))
		}
	}

	return r, nil
}

func sum(nums ...int) int {
	total := 0

	for _, num := range nums {
		total += num
	}

	return total
}

func solveP1(dataPath string) (int, error) {
	data, err := os.ReadFile(dataPath)

	if err != nil {
		return 0, err
	}

	intInp, err := parseInput(data)

	if err != nil {
		return 0, err
	}

	pc, err := morePinecones(intInp)

	if err != nil {
		return 0, nil
	}

	s := sum(pc...)

	return s, nil
}
