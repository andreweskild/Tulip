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

QColor InteractiveGradientRectangle::borderColor() const
{
    return m_borderColor;
}

void InteractiveGradientRectangle::setBorderColor(const QColor &p_borderColor)
{
    if (m_borderColor.rgba() != p_borderColor.rgba())
    {
        m_borderColor = p_borderColor;
        update();
    }
}

int InteractiveGradientRectangle::borderWidth() const
{
    return m_borderWidth;
}

void InteractiveGradientRectangle::setBorderWidth(const int &p_borderWidth)
{
    if (m_borderWidth != p_borderWidth)
    {
        m_borderWidth = p_borderWidth;
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
    if (m_borderWidth % 2 == 0)
    {
        p->setPixelAlign(QNanoPainter::PIXEL_ALIGN_FULL);
    }
    else
    {
        p->setPixelAlign(QNanoPainter::PIXEL_ALIGN_HALF);
    }
//    p->setAntialias(1.1);

//    p->beginPath();

//    if (m_radius == 0)
//    {
//        p->rect(0, 0, width(), height());
//    }
//    else
//    {
//        p->roundedRect(0, 0, width() - m_borderWidth,
//                       height() - m_borderWidth, m_radius);
//    }



//    if(width() > height())
//    {
//        m_gradient.setOuterRadius(width() * 2);
//    }
//    else
//    {
//        m_gradient.setOuterRadius(height() * 2);
//    }
//    m_gradient.setStartColor(m_primaryColor);
//    m_gradient.setEndColor(m_secondaryColor);
//    p->setFillStyle(m_gradient);
//    p->fill();
//    p->setStrokeStyle(m_borderColor);
//    p->setLineWidth(m_borderWidth);
//    p->stroke();
    drawCornerAliasedRoundedRect(p);
}

void InteractiveGradientPainter::drawCornerAliasedRoundedRect(QNanoPainter *p)
{
    float adjustedWidth = width() - m_borderWidth;
    float adjustedHeight = height() - m_borderWidth;
    p->beginPath();
    p->setAntialias(0.0);
    p->moveTo(m_radius, 0);
    p->lineTo(adjustedWidth - m_radius, 0);
    p->moveTo(adjustedWidth, m_radius);
    p->lineTo(adjustedWidth, adjustedHeight - m_radius);
    p->moveTo(adjustedWidth - m_radius, adjustedHeight);
    p->lineTo(m_radius, adjustedHeight);
    p->moveTo(0, adjustedHeight - m_radius);
    p->lineTo(0, m_radius);
    p->setStrokeStyle(m_borderColor);
    p->setLineWidth(m_borderWidth);
    p->stroke();

    p->beginPath();
    p->setAntialias(1.1);
    p->moveTo(0, m_radius+1);
    p->arc(m_radius, m_radius, m_radius, 3.14, 3*3.14/2);

    p->moveTo(adjustedWidth - m_radius - 1, 0);
    p->arc(adjustedWidth - m_radius, m_radius, m_radius, 3*3.14/2, 2*3.14);
    p->lineTo(adjustedWidth, m_radius + 1);

    p->moveTo(adjustedWidth, adjustedHeight - m_radius - 1);
    p->arc(adjustedWidth - m_radius, adjustedHeight - m_radius, m_radius, 2*3.14, 3.14/2);
    p->lineTo(adjustedWidth - m_radius - 1, adjustedHeight);

    p->moveTo(m_radius + 1, adjustedHeight);
    p->arc(m_radius, adjustedHeight - m_radius, m_radius, 3.14/2, 3.14);
    p->lineTo(0, adjustedHeight - m_radius - 1);

    p->stroke();
}

void InteractiveGradientPainter::synchronize(QNanoQuickItem *p_item)
{
    InteractiveGradientRectangle *gradientItem = static_cast<InteractiveGradientRectangle *>(p_item);
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
