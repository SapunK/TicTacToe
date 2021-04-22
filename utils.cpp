#include "utils.h"

#include "stdlib.h"

Utils::Utils(QObject *parent) :
    QObject(parent)
  , m_bGameFinished(false)
{
}

void Utils::fillValue(int i, int j, int value)
{
    m_values[i][j] = value;
    checkForWinner();
}

void Utils::setDefaultValues()
{
    for(int i = 0 ; i < 3 ; i++)
    {
        for(int j = 0 ; j < 3 ; j++)
        {
            m_values[i][j] = -1;
        }
    }
    m_bGameFinished = false;
}

void Utils::checkForWinner()
{
    int firstPlayerRows = 0;
    int secondPlayerRows = 0;
    int firstPlayerCols = 0;
    int secondPlayerCols = 0;
    int firstPlayerD = 0;
    int secondPlayerD = 0;
    int firstPlayerD2 = 0;
    int secondPlayerD2 = 0;
    int noWinner = 0;

    //rows and diagonal
    for(int i = 0 ; i < 3 ; i++)
    {
        firstPlayerRows = 0;
        secondPlayerRows = 0;
        firstPlayerCols = 0;
        secondPlayerCols = 0;
        for(int j = 0 ; j < 3 ; j++)
        {
            if(m_values[i][j] != -1)
                noWinner++;

            if(m_values[i][j] == 1){
                firstPlayerRows++;
                //left to right, top to bottom diagonal
                if (i == j) {
                    firstPlayerD++;
                }
                //right to left, top to bottom diagonal
                if (i + j == 2) {
                    firstPlayerD2++;
                }
            } else if (m_values[i][j] == 0){
                secondPlayerRows++;
                //left to right, top to bottom diagonal
                if(i == j) {
                    secondPlayerD++;
                }
                //right to left, top to bottom diagonal
                if (i + j == 2) {
                    secondPlayerD2++;
                }
            }

            //columns
            if(m_values[j][i] == 1)
                firstPlayerCols++;
            else if(m_values[j][i] == 0)
                secondPlayerCols++;

            if(firstPlayerRows == 3 || firstPlayerD == 3 || firstPlayerD2 == 3 || firstPlayerCols == 3){
                emit gameFinished(1);
                return;
            } else if(secondPlayerRows == 3 || secondPlayerD == 3 || secondPlayerD2 == 3 || secondPlayerCols == 3){
                emit gameFinished(0);
                return;
            }
        }
    }

    if(noWinner == 9) {
        emit gameFinished(-1);
        return;
    }
}

void Utils::aiFillField()
{
    if(m_bGameFinished)
        return;

    //try to win
    if(winOrBlock(false))
        return;

    //try to block player if he is winning
    if(winOrBlock(true))
        return;

    //fill random field
    while(true)
    {
        //I feel like rand() is more random than QRandomGenerator.. :)
        int i = rand() % 3;
        int j = rand() % 3;

        if(m_values[i][j] == -1)
        {
            m_values[i][j] = 0;
            emit aiFieldFilled(i, j);
            checkForWinner();
            return;
        }
    }
}

bool Utils::winOrBlock(bool bTryBlocking)
{
    int row = -1;
    int col = -1;
    int diagonalOneVal = 0;
    int diagonalTwoVal = 0;
    int diagonal = -1;

    for(int i = 0 ; i < 3 ; i++)
    {
        int rowValue = 0;
        int colValue = 0;
        for(int j = 0 ; j < 3 ; j++)
        {
            if(m_values[i][j] == bTryBlocking ? 1 : 0)
                rowValue++;
            if(m_values[j][i] == bTryBlocking ? 1 : 0)
                colValue++;

            if(i == j && m_values[i][j] == bTryBlocking ? 1 : 0)
                diagonalOneVal++;

            if(i + j == 2 && m_values[i][j] == bTryBlocking ? 1 : 0)
                diagonalTwoVal++;

            if(rowValue == 2)
                row = i;

            if(colValue == 2)
                col = i;

            if(diagonalOneVal == 2)
                diagonal = 1;

            if(diagonalTwoVal == 2)
                diagonal = 2;

            if(row != -1)
            {
                for(int k = 0 ; k < 3 ; k++)
                {
                    if(m_values[row][k] == -1)
                    {
                        m_values[row][k] = 0;
                        emit aiFieldFilled(row, k);
                        checkForWinner();
                        return true;
                    }
                }
            }

            if(col != -1)
            {
                for(int k = 0 ; k < 3 ; k++)
                {
                    if(m_values[k][col] == -1)
                    {
                        m_values[k][col] = 0;
                        emit aiFieldFilled(k, col);
                        checkForWinner();
                        return true;
                    }
                }
            }

            if(diagonal == 1)
            {
                for(int k = 0 ; k < 3 ; k++)
                {
                    if(m_values[k][k] == -1)
                    {
                        m_values[k][k] = 0;
                        emit aiFieldFilled(k, k);
                        checkForWinner();
                        return true;
                    }
                }
            }

            if(diagonal == 2)
            {
                for(int k = 0 ; k < 3 ; k++)
                {
                    for(int l = 0 ; l < 3 ; l++)
                    {
                        if(k + l == 2 && m_values[k][l] == -1)
                        {
                            m_values[k][l] = 0;
                            emit aiFieldFilled(k, l);
                            checkForWinner();
                            return true;
                        }
                    }
                }
            }
        }
    }
    return false;
}
