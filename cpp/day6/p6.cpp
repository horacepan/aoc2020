#include <fstream>
#include <iostream>
#include <vector>
#include <string>
#include <set>
#include <algorithm>
#include <iterator>

int get_uniques(std::vector<std::string> &lines) {
  std::set<char> qs;

  for (auto ln: lines) {
    for (auto c: ln) {
      qs.insert(c);
    }
  }
  return qs.size();
}

int get_all_uniques(std::vector<std::string> &lines) {
  return 0;
}

int main() {
  std::string fname = "../../data/p6.txt";
  std::ifstream file(fname);
  std::string line;
  int tot = 0;
  int tot_all = 0;
  std::vector<std::string> curr_group;

  while (getline(file, line)) {
    if (line.size() == 0) {
      tot += get_uniques(curr_group);
      tot_all += get_all_uniques(curr_group);
      curr_group.clear();
    } else {
      curr_group.push_back(line);
    }
  }
  std::cout << "Part one: " << tot << std::endl;
  return 0;
}

int main2() {
  std::string stuff = "acac";
  std::set<char> vals;

  for(auto c: stuff) {
    vals.insert(c);
  }
  std::cout << vals.size() << std::endl;
  return 0;
}
