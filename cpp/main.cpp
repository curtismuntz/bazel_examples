#include "hello_lib.h"
#include <iostream>

int main(int argc, char** argv) {

  auto printme = hello_lib::constructString();
  std::cout << printme << std::endl;
  return 0;

}
