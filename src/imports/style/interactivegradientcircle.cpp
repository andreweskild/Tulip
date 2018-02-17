#include "interactivegradientcircle.h"

InteractiveGradientCircle::InteractiveGradientCircle(QQuickItem *p_parent) : QNanoQuickItem(p_parent)
{
    setAcceptHoverEvents(true);
}

QColor InteractiveGradientCircle::primaryColor() const
{
    return m_primaryColor;
}

void InteractiveGradientCircle::setPrimaryColor(const QColor &p_primaryColor)
{
    if (m_primaryColor.rgba() != p_primaryColor.rgba())
    {
        m_primaryColor = p_primaryColor;
        update();
    }
}

QColor InteractiveGradientCircle::secondaryColor() const
{
    return m_secondaryColor;
}

void InteractiveGradientCircle::setSecondaryColor(const QColor &p_secondaryColor)
{
    if (m_secondaryColor.rgba() != p_secondaryColor.rgba())
    {
        m_secondaryColor = p_secondaryColor;
        update();
    }
}

QColor InteractiveGradientCircle::borderColor() const
{
    return m_borderColor;
}

void InteractiveGradientCircle::setBorderColor(const QColor &p_borderColor)
{
    if (m_borderColor.rgba() != p_borderColor.rgba())
    {
        m_borderColor = p_borderColor;
        update();
    }
}

int InteractiveGradientCircle::borderWidth() const
{
    return m_borderWidth;
}

void InteractiveGradientCircle::setBorderWidth(const int &p_borderWidth)
{
    if (m_borderWidth != p_borderWidth)
    {
        m_borderWidth = p_borderWidth;
        update();
    }
}

QPointF InteractiveGradientCircle::mousePosition() const
{
    return m_mousePos;
}

void InteractiveGradientCircle::updateMousePosition(const QPointF &p_mousePos)
{
    m_mousePos = p_mousePos;
    update();
}

void InteractiveGradientCircle::hoverMoveEvent(QHoverEvent *p_event)
{
    updateMousePosition(p_event->posF());
}

QNanoQuickItemPainter *InteractiveGradientCircle::createItemPainter() const
{
    return new InteractiveCirclePainter();
}


InteractiveCirclePainter::InteractiveCirclePainter()
{
}

void InteractiveCirclePainter::paint(QNanoPainter *p)
{
    p->beginPath();

    p->circle(width() * .5 - .5, height() * .5 - .5, width() * .5 - m_borderWidth);

    m_gradient.setOuterRadius(height() * 2);
    m_gradient.setStartColor(m_primaryColor);
    m_gradient.setEndColor(m_secondaryColor);
    p->setFillStyle(m_gradient);
    p->fill();
    p->setStrokeStyle(m_borderColor);
    p->setLineWidth(m_borderWidth);
    p->stroke();
}

void InteractiveCirclePainter::synchronize(QNanoQuickItem *p_item)
{
    InteractiveGradientCircle *gradientItem = static_cast<InteractiveGradientCircle *>(p_item);
    if(gradientItem)
    {
        m_primaryColor = QNanoColor::fromQColor(gradientItem->primaryColor());
        m_secondaryColor = QNanoColor::fromQColor(gradientItem->secondaryColor());
        m_gradient.setCenterPosition(gradientItem->mousePosition());

        m_borderColor = QNanoColor::fromQColor(gradientItem->borderColor());
        m_borderWidth = gradientItem->borderWidth();

        m_radius = gradientItem->radius();
    }
}
