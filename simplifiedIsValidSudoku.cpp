


#include <iostream>
using namespace std;

bool isValidSudoku(int board[9][9]) {
    bool row[9][9] = {false}, col[9][9] = {false}, blk[9][9] = {false};
    
    for (int i = 0; i < 9; ++i) {
        for (int j = 0; j < 9; ++j) {
            int num = board[i][j];
            if (num) {
                int blkIndex = (i / 3) * 3 + j / 3;
                if (row[i][num - 1] || col[j][num - 1] || blk[blkIndex][num - 1]) {
                    return false;
                }
                row[i][num - 1] = col[j][num - 1] = blk[blkIndex][num - 1] = true;
            }
        }
    }
    return true;
}

int main() {
    int board[9][9];
    for (int i = 0; i < 9; ++i)
        for (int j = 0; j < 9; ++j)
            cin >> board[i][j];

    cout << (isValidSudoku(board) ? "Yes" : "No") << endl;
    return 0;
}


