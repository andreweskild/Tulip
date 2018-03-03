#include "busyindicatorarc.h"

BusyIndicatorArc::BusyIndicatorArc(QQuickItem *p_parent) : QQuickPaintedItem(p_parent),
    m_arcLength(120)
{
    connect(this, SIGNAL(arcLengthChanged()), this, SLOT(update()));
}

void BusyIndicatorArc::componentComplete()
{
    QQuickPaintedItem::componentComplete();
    m_fillPen.setCapStyle(Qt::RoundCap);
    m_borderPen.setCapStyle(Qt::RoundCap);
}

void BusyIndicatorArc::paint(QPainter *p_painter)
{
    QQuickPaintedItem::setAntialiasing(true);
    QRectF rect(boundingRect().adjusted(m_borderAdjustment, m_borderAdjustment, -m_borderAdjustment, -m_borderAdjustment));

    p_painter->setPen(m_borderPen);
    p_painter->drawArc(rect, 30 * 16, m_arcLength * 16);

    p_painter->setPen(m_fillPen);
    p_painter->drawArc(rect, 30 * 16, m_arcLength * 16);

}

QColor BusyIndicatorArc::color() const
{
    return m_fillPen.color();
}

void BusyIndicatorArc::setColor(const QColor &p_color)
{
    if (m_fillPen.color() != p_color)
    {
        m_fillPen.setColor(p_color);
        update();
        emit colorChanged();
    }
}

QColor BusyIndicatorArc::borderColor() const
{
    return m_borderPen.color();
}

void BusyIndicatorArc::setBorderColor(const QColor &p_color)
{
    if (m_borderPen.color() != p_color)
    {
        m_borderPen.setColor(p_color);
        update();
        emit borderColorChanged();
    }
}

int BusyIndicatorArc::arcWidth() const
{
    return m_borderPen.width();
}

void BusyIndicatorArc::setArcWidth(const int &p_arcWidth)
{
    if(m_borderPen.width() != p_arcWidth)
    {
        m_borderPen.setWidth(p_arcWidth);
        m_fillPen.setWidth(p_arcWidth - 2);
        m_borderAdjustment = p_arcWidth * .5;

        update();
        emit arcWidthChanged();
    }
}
