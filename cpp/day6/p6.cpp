#include <fstream>
#include <iostream>
#include <vector>
#include <string>
#include <set>
#include <algorithm>
#include <iterator>
#include <array>

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
  int uniques = 0;
  std::array<int, 26> counts;
  counts.fill(0);

  for (auto ln: lines) {
    for (auto c: ln) {
      counts[c - 'a'] += 1;
    }
  }

  for (auto cnt: counts) {
    if (cnt == lines.size()) {
      uniques += 1;
    }
  }
  return uniques;
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
  std::cout << "Part two: " << tot_all << std::endl;
  return 0;
}
