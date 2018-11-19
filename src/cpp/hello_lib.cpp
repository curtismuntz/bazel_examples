#include "hello_lib.h"
namespace hello_lib {

std::string constructString() {
  auto env_var = std::getenv("BALENA_USER");
  auto user = env_var ? env_var : std::string{"World"};
  auto str = "Hello " + user + "!";
  return str;
}

}
