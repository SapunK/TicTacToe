#include "utils.h"
#include <QDebug>

Utils::Utils(QObject *parent) :
    QObject(parent)
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
}

void Utils::checkForWinner()
{
    int firstPlayer = 0;
    int secondPlayer = 0;
    int firstPlayerD = 0;
    int secondPlayerD = 0;
    int firstPlayerD2 = 0;
    int secondPlayerD2 = 0;
    int noWinner = 0;

    //rows and diagonal
    for(int i = 0 ; i < 3 ; i++)
    {
        firstPlayer = 0;
        secondPlayer = 0;
        for(int j = 0 ; j < 3 ; j++)
        {
            if(m_values[i][j] != -1)
                noWinner++;

            if(m_values[i][j] == 1){
                firstPlayer++;
                //left to right, top to bottom diagonal
                if (i == j) {
                    firstPlayerD++;
                }
                //right to left, top to bottom diagonal
                if (i + j == 2) {
                    firstPlayerD2++;
                }
            } else if (m_values[i][j] == 0){
                secondPlayer++;
                //left to right, top to bottom diagonal
                if(i == j) {
                    secondPlayerD++;
                }
                //right to left, top to bottom diagonal
                if (i + j == 2) {
                    secondPlayerD2++;
                }
            }

            if(firstPlayer == 3 || firstPlayerD == 3 || firstPlayerD2 == 3){
                emit gameFinished(1);
                return;
            } else if(secondPlayer == 3 || secondPlayerD == 3 || secondPlayerD2 == 3){
                emit gameFinished(0);
                return;
            }
        }
    }


    //columns
    for(int i = 0 ; i < 3 ; i++)
    {
        firstPlayer = 0;
        secondPlayer = 0;
        for(int j = 0 ; j < 3 ; j++)
        {
            if(m_values[j][i] == 1)
                firstPlayer++;
            else if(m_values[j][i] == 0)
                secondPlayer++;

            if(firstPlayer == 3){
                emit gameFinished(1);
                return;
            } else if(secondPlayer == 3){
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
    for(int i = 0 ; i < 3 ; i++)
    {
        for(int j = 0 ; j < 3 ; j++)
        {
            if(m_values[i][j] == -1){
                m_values[i][j] = 0;
                emit aiFieldFilled(i, j);
                checkForWinner();
                return;
            }
        }
    }
}
