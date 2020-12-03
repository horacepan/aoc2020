#include <iostream>
#include <fstream>
#include <vector>
#include <string>

int get_trees(std::vector<std::string> &map, int dx, int dy) {
  int rows = map.size();
  int cols= map[0].length();
  int loc_x = 0;
  int loc_y = 0;
  int ntrees = 0;

  while (true) {
    if (loc_x < rows) {
      ntrees += (map[loc_x][loc_y] == '#');
    } else {
      break;
    }
    loc_x = loc_x + dx;
    loc_y = (loc_y + dy) % cols;
  }
  return ntrees;
}

int main() {
  std::string fname = "../../data/p3.txt";
  std::ifstream file(fname);
  std::string line;
  std::vector<std::string> map;
  std::vector<int> vals;

  while(getline(file, line)) {
    map.push_back(line);
  }

  int a1 = get_trees(map, 1, 1);
  int a2 = get_trees(map, 1, 3);
  int a3 = get_trees(map, 1, 5);
  int a4 = get_trees(map, 1, 7);
  int a5 = get_trees(map, 2, 1);
  vals.push_back(a1);
  vals.push_back(a2);
  vals.push_back(a3);
  vals.push_back(a4);
  vals.push_back(a5);
  long int  prod = 1;
  for(auto n: vals) {
    prod *= n;
  }

  std::cout << "Part one: " << a2 << std::endl;
  std::cout << "Part two: " << prod << std::endl;
  return 0;
}
