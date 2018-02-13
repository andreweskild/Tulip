#include "interactivegradientrectangle.h"

InteractiveGradientRectangle::InteractiveGradientRectangle(QQuickItem *p_parent) : QNanoQuickItem(p_parent)
{
    setAcceptHoverEvents(true);
}

QColor InteractiveGradientRectangle::primaryColor() const
{
    return m_primaryColor;
}

void InteractiveGradientRectangle::setPrimaryColor(const QColor &p_primaryColor)
{
    if (m_primaryColor.rgba() != p_primaryColor.rgba())
    {
        m_primaryColor = p_primaryColor;
        update();
    }
}

QColor InteractiveGradientRectangle::secondaryColor() const
{
    return m_secondaryColor;
}

void InteractiveGradientRectangle::setSecondaryColor(const QColor &p_secondaryColor)
{
    if (m_secondaryColor.rgba() != p_secondaryColor.rgba())
    {
        m_secondaryColor = p_secondaryColor;
        update();
    }
}

QPointF InteractiveGradientRectangle::mousePosition() const
{
    return m_mousePos;
}

void InteractiveGradientRectangle::updateMousePosition(const QPointF &p_mousePos)
{
    m_mousePos = p_mousePos;
    update();
}

void InteractiveGradientRectangle::hoverMoveEvent(QHoverEvent *p_event)
{
    updateMousePosition(p_event->posF());
}

QNanoQuickItemPainter *InteractiveGradientRectangle::createItemPainter() const
{
    return new InteractiveGradientPainter();
}


InteractiveGradientPainter::InteractiveGradientPainter()
{
}

void InteractiveGradientPainter::paint(QNanoPainter *p)
{
    p->beginPath();
    p->roundedRect(0, 0, width(), height(), M_RADIUS);
    if(width() > height())
    {
        m_gradient.setOuterRadius(width() * 2);
    }
    else
    {
        m_gradient.setOuterRadius(height() * 2);
    }
    m_gradient.setStartColor(m_primaryColor);
    m_gradient.setEndColor(m_secondaryColor);
    p->setFillStyle(m_gradient);
    p->fill();
}

void InteractiveGradientPainter::synchronize(QNanoQuickItem *p_item)
{
    InteractiveGradientRectangle *gradientItem = static_cast<InteractiveGradientRectangle *>(p_item);
    if(gradientItem)
    {
        m_primaryColor = QNanoColor::fromQColor(gradientItem->primaryColor());
        m_secondaryColor = QNanoColor::fromQColor(gradientItem->secondaryColor());
        m_gradient.setCenterPosition(gradientItem->mousePosition());
    }
}
