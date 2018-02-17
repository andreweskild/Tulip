#include "bordergroup.h"

BorderGroup::BorderGroup(QObject *parent) : QObject(parent)
{
}

QColor BorderGroup::color() const
{
    return m_color;
}

void BorderGroup::setColor(const QColor &p_color)
{
    if (m_color != p_color)
    {
        m_color = p_color;
        emit colorChanged();
    }
}


int BorderGroup::width() const
{
    return m_width;
}

void BorderGroup::setWidth(const int &p_width)
{
    if (m_width != p_width)
    {
        m_width = p_width;
        emit widthChanged();
    }
}
