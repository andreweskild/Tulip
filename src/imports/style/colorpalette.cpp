#include "colorpalette.h"

ColorPalette::ColorPalette(QObject *parent) : QObject(parent),
    m_theme(ColorPalette::Light)
{
    updateTheme();
}

void ColorPalette::updateTheme()
{
    switch(m_theme)
    {
    case ColorPalette::Light:
    {
        changeToLightTheme();
        break;
    }
    case ColorPalette::Dark:
    {
        changeToDarkTheme();
        break;
    }
    }
}

void ColorPalette::changeToLightTheme()
{
    m_accent = QColor::fromRgb(255, 207, 35);
    m_accentLight = QColor::fromRgb(255, 246, 59);
    m_accentDark = QColor::fromRgb(245, 186, 23);
    m_accentHighlight = QColor::fromRgb(255, 227, 121);
    m_accentBorder = QColor::fromRgb(232, 170, 25);

    m_content = QColor::fromRgb(101, 93, 109);
    m_contentSecondary = QColor::fromRgb(255, 255, 255);
    m_contentAccented = QColor::fromRgb(147, 84, 22);

    m_window = QColor::fromRgb(230, 227, 232);
    m_windowHighlight = QColor::fromRgb(242, 241, 243);

    m_sunken = QColor::fromRgb(217, 214, 220);
    m_sunkenBorder = QColor::fromRgb(204, 200, 208);

    m_sunkenDark = QColor::fromRgb(101, 93, 109);
    m_sunkenDarkBorder = QColor::fromRgb(52, 48, 56);

    m_raised = QColor::fromRgb(243, 243, 244);
    m_raisedHighlight = QColor::fromRgb(254, 254, 255);

    m_shadow = QColor(0, 0, 0, 40);
}

void ColorPalette::changeToDarkTheme()
{
}


ColorPalette::Theme ColorPalette::theme() const
{
    return m_theme;
}

void ColorPalette::setTheme(const ColorPalette::Theme &p_theme)
{
    if (m_theme != p_theme)
    {
        m_theme = p_theme;
        emit themeChanged();
        updateTheme();
    }
}

// Accent Color Group
QColor ColorPalette::accent() const
{
    return m_accent;
}
QColor ColorPalette::accentLight() const
{
    return m_accentLight;
}
QColor ColorPalette::accentDark() const
{
    return m_accentDark;
}
QColor ColorPalette::accentHighlight() const
{
    return m_accentHighlight;
}
QColor ColorPalette::accentBorder() const
{
    return m_accentBorder;
}

// Raised Color Group
QColor ColorPalette::raised() const
{
    return m_raised;
}
QColor ColorPalette::raisedHighlight() const
{
    return m_raisedHighlight;
}

// Window Color Group
QColor ColorPalette::window() const
{
    return m_window;
}
QColor ColorPalette::windowHighlight() const
{
    return m_windowHighlight;
}

// Sunken Color Group
QColor ColorPalette::sunken() const
{
    return m_sunken;
}
QColor ColorPalette::sunkenBorder() const
{
    return m_sunkenBorder;
}

// Sunken Dark Color Group
QColor ColorPalette::sunkenDark() const
{
    return m_sunkenDark;
}
QColor ColorPalette::sunkenDarkBorder() const
{
    return m_sunkenDarkBorder;
}

// Content Color Group
QColor ColorPalette::content() const
{
    return m_content;
}
QColor ColorPalette::contentSecondary() const
{
    return m_contentSecondary;
}
QColor ColorPalette::contentAccented() const
{
    return m_contentAccented;
}


QColor ColorPalette::shadow() const
{
    return m_shadow;
}

