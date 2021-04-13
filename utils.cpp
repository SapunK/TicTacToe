#include "utils.h"

#include <QDebug>

Utils::Utils(QObject *parent) :
    QObject(parent)
{
    for(int i = 0 ; i < 3 ; i++)
    {
        for(int j = 0 ; j < 3 ; j++)
        {
            m_values[i][j] = -1;
        }
    }
}

void Utils::fillValue(int i, int j, int value)
{
    m_values[i][j] = value;
    checkForWinner();
}

void Utils::checkForWinner()
{
    int firstPlayer = 0;
    int secondPlayer = 0;
    int firstPlayerD = 0;
    int secondPlayerD = 0;

    //rows and diagonal
    for(int i = 0 ; i < 3 ; i++)
    {
        firstPlayer = 0;
        secondPlayer = 0;
        for(int j = 0 ; j < 3 ; j++)
        {

            if(m_values[i][j] == 1){
                firstPlayer++;
                if(i == j || (i == 0 && j == 2) || (i == 2 && j == 0))
                    firstPlayerD++;
            }
            else if(m_values[i][j] == 0){
                secondPlayer++;
                if(i == j || (i == 0 && j == 2) || (i == 2 && j == 0))
                    secondPlayerD++;
            }

            if(firstPlayer == 3 || firstPlayerD == 3){
                emit gameFinished(1);
                return;
            } else if(secondPlayer == 3 || secondPlayerD == 3){
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
}
