
#include <bits/stdc++.h>
using namespace std;


bool isValidSudoku(const vector<vector<int>>& board) {
    for (int i = 0; i < 9; ++i) {
        unordered_set<int> row, col, blk;
        for (int j = 0; j < 9; ++j) {

            if (row.find(board[i][j]) != row.end() || col.find(board[j][i]) != col.end())
                return false;
            row.insert(board[i][j]);
            col.insert(board[j][i]);


            int blkRow = (i / 3) * 3 + j / 3;
            int blkCol = (i % 3) * 3 + j % 3;
           
            if (blk.find(board[blkRow][blkCol]) != blk.end())
                return false;
            blk.insert(board[blkRow][blkCol]);
        }
    }
    return true;
}

int main() {
    vector<vector<int>> board(9, vector<int>(9));
    for (int i = 0; i < 9; ++i)
        for (int j = 0; j < 9; ++j)
            cin >> board[i][j];

    cout << (isValidSudoku(board) ? "Yes" : "No") << endl;
    return 0;
}