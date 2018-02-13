#ifndef INTERACTIVEGRADIENTRECTANGLE_H
#define INTERACTIVEGRADIENTRECTANGLE_H

#include "qnanoquickitem.h"
#include "qnanoquickitempainter.h"
#include "qnanoradialgradient.h"

class InteractiveGradientRectangle : public QNanoQuickItem
{
    Q_OBJECT

    Q_PROPERTY(QColor primaryColor READ primaryColor WRITE setPrimaryColor NOTIFY primaryColorChanged)
    Q_PROPERTY(QColor secondaryColor READ secondaryColor WRITE setSecondaryColor NOTIFY secondaryColorChanged)
public:
    InteractiveGradientRectangle(QQuickItem *p_parent = nullptr);

    QColor primaryColor() const;
    void setPrimaryColor(const QColor &p_primaryColor);

    QColor secondaryColor() const;
    void setSecondaryColor(const QColor &p_secondaryColor);


    QPointF mousePosition() const;
    void updateMousePosition(const QPointF &p_mousePos);

    QNanoQuickItemPainter *createItemPainter() const;

signals:
    void primaryColorChanged();
    void secondaryColorChanged();

protected:
    void hoverMoveEvent(QHoverEvent *p_event);

private:

    QPointF m_mousePos;

    QColor m_primaryColor;
    QColor m_secondaryColor;

public slots:
};

class InteractiveGradientPainter : public QNanoQuickItemPainter
{
public:

    InteractiveGradientPainter();

    void paint(QNanoPainter *p);

    void synchronize(QNanoQuickItem *p_item);

private:
    QNanoRadialGradient m_gradient;

    QNanoColor m_primaryColor;
    QNanoColor m_secondaryColor;
    QPointF m_mousePos;


    const int M_RADIUS = 3;


};

#endif // INTERACTIVEGRADIENTRECTANGLE_H
