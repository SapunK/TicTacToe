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

signals:
    void gameFinished(int winner);
private:
    int m_values[3][3];
};

#endif // UTILS_H
