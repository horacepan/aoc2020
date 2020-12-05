#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <unordered_map>

std::vector<std::string> ssplit(std::string s, std::string delimiter) {
  std::vector<std::string> splits;
  std::string fragment = s;
  std::string other;
  int idx = 0;
  int pos = 0;
  int cnt = 0;

  while (true) {
    pos = fragment.find(delimiter);
    if (pos == std::string::npos) {
      // grab entirety
      splits.push_back(fragment);
      break;
    } else {
      other = fragment.substr(pos);
      splits.push_back(fragment.substr(0, pos));
      fragment = fragment.substr(pos + 1, pos + fragment.size());
    }
    cnt += 1;
  }
  return splits;
}

std::unordered_map<std::string, std::string> get_record(std::vector<std::string> &lines) {
  std::unordered_map<std::string, std::string> record;
  std::vector<std::string> splits;
  int colon_idx;

  for (auto l: lines) {
    splits = ssplit(l, " ");
    for (auto s: splits) {
      colon_idx = s.find(":");
      record[s.substr(0, colon_idx)] = s.substr(colon_idx + 1);
    }
  }
  return record;
}

bool is_valid(std::unordered_map<std::string, std::string> rec) {
  return (rec.size() == 8) ||
         ((rec.size() == 7) && (rec.find("cid") == rec.end()));
}

int main() {
  std::string fname = "../../data/p4.txt";
  std::ifstream file(fname);

  std::string line;
  std::vector<std::string> lines;
  int tot_recs = 0;
  int tot_recs_strict = 0;
  std::unordered_map<std::string, std::string> rec;
  std::vector<std::string> curr_line;

  while (getline(file, line)) {
    if (line.size() == 0) {
      // tot_recs += 1;
      rec = get_record(curr_line);
      tot_recs += int(is_valid(rec));
      curr_line.clear();
    } else {
      curr_line.push_back(line);
    }
  }
  std::cout << tot_recs << std::endl;
  return 0;
}
