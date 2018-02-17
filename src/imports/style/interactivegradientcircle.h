#ifndef INTERACTIVEGRADIENTCIRCLE_H
#define INTERACTIVEGRADIENTCIRCLE_H

#include "qnanoquickitem.h"
#include "qnanoquickitempainter.h"
#include "qnanoradialgradient.h"
#include "bordergroup.h"
#include <QtMath>

class InteractiveGradientCircle : public QNanoQuickItem
{
    Q_OBJECT

    Q_PROPERTY(QColor primaryColor READ primaryColor WRITE setPrimaryColor NOTIFY primaryColorChanged)
    Q_PROPERTY(QColor secondaryColor READ secondaryColor WRITE setSecondaryColor NOTIFY secondaryColorChanged)
    Q_PROPERTY(QColor borderColor READ borderColor WRITE setBorderColor NOTIFY borderColorChanged)
    Q_PROPERTY(int borderWidth READ borderWidth WRITE setBorderWidth NOTIFY borderWidthChanged)
public:
    InteractiveGradientCircle(QQuickItem *parent = nullptr);

    QColor primaryColor() const;
    void setPrimaryColor(const QColor &p_primaryColor);

    QColor secondaryColor() const;
    void setSecondaryColor(const QColor &p_secondaryColor);

    QColor borderColor() const;
    void setBorderColor(const QColor &p_borderColor);

    int borderWidth() const;
    void setBorderWidth(const int &p_borderWidth);

    QPointF mousePosition() const;
    void updateMousePosition(const QPointF &p_mousePos);

    int radius() {
        return m_radius;
    }

    QNanoQuickItemPainter *createItemPainter() const;

signals:
    void primaryColorChanged();
    void secondaryColorChanged();

    void radiusChanged();
    void borderColorChanged();
    void borderWidthChanged();

protected:
    void hoverMoveEvent(QHoverEvent *p_event);

private:

    QPointF m_mousePos;

    QColor m_primaryColor;
    QColor m_secondaryColor;
    QColor m_borderColor;
    int m_borderWidth;

    int m_radius;
public slots:
};

class InteractiveCirclePainter : public QNanoQuickItemPainter
{
public:

    InteractiveCirclePainter();

    void paint(QNanoPainter *p);

    void synchronize(QNanoQuickItem *p_item);

private:
    QNanoRadialGradient m_gradient;

    QNanoColor m_primaryColor;
    QNanoColor m_secondaryColor;
    QNanoColor m_borderColor;

    int m_borderWidth;

    int m_radius;

    QPointF m_mousePos;


};


#endif // INTERACTIVEGRADIENTCIRCLE_H
