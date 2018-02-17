#ifndef BORDERGROUP_H
#define BORDERGROUP_H

#include <QObject>
#include <QColor>

class BorderGroup : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int width READ width WRITE setWidth NOTIFY widthChanged)
    Q_PROPERTY(QColor color WRITE setColor NOTIFY colorChanged)
public:
    explicit BorderGroup(QObject *parent = nullptr);

    QColor color() const;
    void setColor(const QColor &p_color);

    int width() const;
    void setWidth(const int &p_width);

signals:
    void widthChanged();
    void colorChanged();

public slots:

private:
    int m_width;
    QColor m_color;
};

#endif // BORDERGROUP_H
