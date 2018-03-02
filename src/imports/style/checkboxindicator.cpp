#include "checkboxindicator.h"

CheckBoxIndicator::CheckBoxIndicator(QQuickItem *parent) : QQuickPaintedItem(parent),
    m_dashOffset(6)
{
}

void CheckBoxIndicator::componentComplete()
{
    QQuickPaintedItem::componentComplete();

    m_checkPath.moveTo(width()*.25, height() * .52);
    m_checkPath.lineTo(width() * .45, height() * .7);
    m_checkPath.lineTo(width()*.75, height() * .35);

    m_dashes << 14 << 14;
    m_checkPen.setDashPattern(m_dashes);
    m_checkPen.setCapStyle(Qt::RoundCap);
}


void CheckBoxIndicator::paint(QPainter *painter)
{
    QQuickPaintedItem::setAntialiasing(true);
    if (opacity() > 0)
    {
        m_checkPen.setDashOffset(m_dashOffset);
        painter->setPen(m_checkPen);
        painter->drawPath(m_checkPath);
    }
}

qreal CheckBoxIndicator::dashOffset() const
{
    return m_dashOffset;
}

void CheckBoxIndicator::setDashOffset(qreal &p_dashOffset)
{
    if(m_dashOffset != p_dashOffset)
    {
        m_dashOffset = p_dashOffset;
        update();
        emit dashOffsetChanged();
    }
}

qreal CheckBoxIndicator::lineWidth() const
{
    return m_checkPen.widthF();
}

void CheckBoxIndicator::setLineWidth(qreal &p_lineWidth)
{
    if(p_lineWidth != lineWidth())
    {
        m_checkPen.setWidthF(p_lineWidth);
        update();
        emit lineWidthChanged();
    }
}

QColor CheckBoxIndicator::color() const
{
    return m_checkPen.color();
}

void CheckBoxIndicator::setColor(QColor &p_color)
{
    if(p_color != color())
    {
        m_checkPen.setColor(p_color);
        update();
        emit colorChanged();
    }
}
