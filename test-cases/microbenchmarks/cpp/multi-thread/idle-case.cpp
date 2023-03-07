#include <chrono>
#include <thread>

int main() {
    std::chrono::seconds duration(15);
    std::this_thread::sleep_for(duration);
    return 0;
}