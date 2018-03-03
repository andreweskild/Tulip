#ifndef BUSYINDICATORARC_H
#define BUSYINDICATORARC_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QPainter>
#include <QPainterPath>

class BusyIndicatorArc : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(QColor borderColor READ borderColor WRITE setBorderColor NOTIFY borderColorChanged)
    Q_PROPERTY(int arcWidth READ arcWidth WRITE setArcWidth NOTIFY arcWidthChanged)
    Q_PROPERTY(int arcLength MEMBER m_arcLength NOTIFY arcLengthChanged)
public:
    BusyIndicatorArc(QQuickItem *p_parent = 0);

    void paint(QPainter *p_painter);

    void componentComplete();

    QColor color() const;
    void setColor(const QColor &p_color);


    QColor borderColor() const;
    void setBorderColor(const QColor &p_color);

    int arcWidth() const;
    void setArcWidth(const int &p_arcWidth);

signals:
    void colorChanged();
    void borderColorChanged();
    void arcWidthChanged();
    void arcLengthChanged();

private:
    QColor m_arcColor;
    int m_arcWidth;
    int m_arcLength;

    QPen m_fillPen;
    QPen m_borderPen;
    qreal m_borderAdjustment;


};

#endif // BUSYINDICATORARC_H
