#ifndef BUSYINDICATORARC_H
#define BUSYINDICATORARC_H

#include <QObject>

class BusyIndicatorArc : public QObject
{
    Q_OBJECT
public:
    explicit BusyIndicatorArc(QObject *parent = nullptr);

signals:

public slots:
};

#endif // BUSYINDICATORARC_H