#ifndef CHECKBOXINDICATOR_H
#define CHECKBOXINDICATOR_H

#include <QObject>
#include <QQuickPaintedItem>
#include <QPainter>
#include <QPainterPath>

class CheckBoxIndicator : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QColor color READ color WRITE setColor NOTIFY colorChanged)
    Q_PROPERTY(qreal lineWidth READ lineWidth WRITE setLineWidth NOTIFY lineWidthChanged)
    Q_PROPERTY(qreal dashOffset READ dashOffset WRITE setDashOffset NOTIFY dashOffsetChanged)
public:
    CheckBoxIndicator(QQuickItem *parent = nullptr);


    void paint(QPainter *painter);

    qreal dashOffset() const;
    void setDashOffset(const qreal &p_dashOffset);

    qreal lineWidth() const;
    void setLineWidth(const qreal &p_lineWidth);

    QColor color() const;
    void setColor(const QColor &p_color);


signals:
    void colorChanged();
    void dashOffsetChanged();
    void lineWidthChanged();

protected:
    void componentComplete();

private:

    qreal m_dashOffset;

    QPen m_checkPen;
    QPainterPath m_checkPath;
    QVector<qreal> m_dashes;
};

#endif // CHECKBOXINDICATOR_H
