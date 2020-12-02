#include <iostream>
#include <fstream>
#include <vector>
#include <string>

struct line_contents_t {
  int low;
  int hi;
  char letter;
  std::string password;
};

line_contents_t get_content(std::string line) {
  line_contents_t l;
  l.low = stoi(line.substr(0, dash_idx));
  l.hi = stoi(line.substr(dash_idx + 1, space_idx));

  l.letter = line[space_idx + 1];
  l.password = line.substr(colon_idx + 2);
  return l;
}

int eval_password(line_contents_t l) {
  int cnt = 0;
  for (auto c: l.password) {
    if (c == l.letter) {
      cnt += 1;
    }
  }
  return int((l.low <= cnt) && (cnt <= l.hi));
}

int eval_password_two(line_contents_t l) {
  return ((l.password[l.low - 1] == l.letter) & (l.password[l.hi - 1] != l.letter)) |
         ((l.password[l.low - 1] != l.letter) & (l.password[l.hi - 1] == l.letter));
}

int main() {
  std::string fname = "../../data/p2.txt";
  std::ifstream file(fname);
  std::string line;

  int tot1 = 0;
  int tot2 = 0;
  line_contents_t l;
  while(getline(file, line)) {
    l = get_content(line);
    tot1 += eval_password(l);
    tot2 += eval_password_two(l);
  }
  std::cout << "Part one: " << tot1 << std::endl;
  std::cout << "Part two: " << tot2 << std::endl;
}
