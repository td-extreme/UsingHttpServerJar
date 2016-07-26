#!/bin/bash

TESTPATH=./temp
EXIT_CODE=0
RED='\033[0;31m'
GREEN='\033[0;32m'
WHITE='\033[0m'

setUp() {
  ./gradlew run &
  SERVER_PID=$!
  printf "\n\n:Blackbox Tests:\n"
  cd ./src/blackboxTest/bash
  mkdir ${TESTPATH}
  printf "There is a 15 second wait to ensure the HttpServer is running before any tests execute.\n\n"
  sleep 15
}

tearDown() {
  rm -rf ${TESTPATH}
  kill $SERVER_PID
}

displayResults() {
  if [ $EXIT_CODE -eq 0 ]; then
    printf "\n\nBLACKBOX TESTS PASSED\n\n"
  else
    printf "\n\nBLACKBOX TESTS FAILED\n\n"
  fi
}

updateExitCode() {
  if [ $1 -ne 0 ]; then
    EXIT_CODE=$1
  fi
}

testCustomRoute() {
  ./getHelloPath.sh | nc localhost 8080 >> ${TESTPATH}/response.txt
  lastLine="`tail -n 1 ${TESTPATH}/response.txt`"
  expected="Hello_World"
  printf "\n BlackboxTest : CustomRoute Hello World is implemented "
  if [ $lastLine == $expected ]; then
    printf "${GREEN} Passed ${WHITE}\n"
  else
    printf "${RED} Failed ${WHITE}\n"
    printf "Value was ${lastLine} expected ${expected}\n"
    more ${TESTPATH}/response.txt
    EXIT_CODE=1
  fi
}

#Main
setUp
testCustomRoute
tearDown
displayResults
exit $EXIT_CODE
