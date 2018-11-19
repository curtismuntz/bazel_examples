#include <chrono>
#include <iostream>
#include <thread>
#include "hello_lib.h"

int main(int argc, char **argv) {
  // auto kMaxPrints = 5;
  auto printme = hello_lib::constructString();
  int i = 0;
  while (true) {
    std::cout << printme << i << std::endl;
    std::this_thread::sleep_for(std::chrono::milliseconds(1000));
    i++;
  }

  return 0;
}
