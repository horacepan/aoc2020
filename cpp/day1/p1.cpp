#include <iostream>
#include <string>
#include <vector>
#include <set>
#include <fstream>


std::vector<int> get_nums() {
  std::string fname = "../data/p1.txt";
  std::ifstream file(fname);
  std::string line;
  std::vector<int> nums;

  while(getline(file, line)) {
    nums.push_back(stoi(line));
  }
  return nums;
}

int main(){
  std::vector<int> nums = get_nums();
  std::set<int> duals;

  int cnt = 0;
  for(auto n: nums){
    if (duals.find(2020 - n) != duals.end()) {
      std::cout << "Part one: " << n * (2020 - n) << std::endl;
      break;
    }
    duals.insert(n);
  }

  for (auto n1: nums) {
    for (auto n2: nums) {
      for (auto n3: nums) {
        if (n1 + n2 + n3 == 2020) {
          std::cout << "Part two: " << n1 * n2 * n3 << std::endl;
          return 0;
        }
      }
    }
  }

  return 0;
}
