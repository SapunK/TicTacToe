#ifndef UTILS_H
#define UTILS_H

#include <QObject>

class Utils : public QObject
{
    Q_OBJECT
public:
    Utils(QObject *parent = nullptr);

    Q_INVOKABLE void fillValue(int i, int j, int value);
    Q_INVOKABLE void setDefaultValues();
    void checkForWinner();
    Q_INVOKABLE void aiFillField();
    Q_INVOKABLE void setGameFinished(bool finished) { m_bGameFinished = finished; }
    bool winOrBlock(bool bTryBlocking);

signals:
    void gameFinished(int winner);
    void aiFieldFilled(int i, int j);
private:
    int m_values[3][3];
    bool m_bGameFinished;
};

#endif // UTILS_H
