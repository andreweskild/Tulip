#ifndef COLORPALETTE_H
#define COLORPALETTE_H

#include <QObject>
#include <QColor>

class ColorPalette : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Theme theme READ theme NOTIFY themeChanged)

    Q_PROPERTY(QColor accent READ accent NOTIFY themeChanged)
    Q_PROPERTY(QColor accentLight READ accentLight NOTIFY themeChanged)
    Q_PROPERTY(QColor accentDark READ accentDark NOTIFY themeChanged)
    Q_PROPERTY(QColor accentHighlight READ accentHighlight NOTIFY themeChanged)
    Q_PROPERTY(QColor accentBorder READ accentBorder NOTIFY themeChanged)

    Q_PROPERTY(QColor content READ content NOTIFY themeChanged)
    Q_PROPERTY(QColor contentSecondary READ contentSecondary NOTIFY themeChanged)
    Q_PROPERTY(QColor contentAccented READ contentAccented NOTIFY themeChanged)

    Q_PROPERTY(QColor window READ window NOTIFY themeChanged)
    Q_PROPERTY(QColor windowHighlight READ windowHighlight NOTIFY themeChanged)

    Q_PROPERTY(QColor sunken READ sunken NOTIFY themeChanged)
    Q_PROPERTY(QColor sunkenBorder READ sunkenBorder NOTIFY themeChanged)

    Q_PROPERTY(QColor sunkenDark READ sunkenDark NOTIFY themeChanged)
    Q_PROPERTY(QColor sunkenDarkBorder READ sunkenDarkBorder NOTIFY themeChanged)

    Q_PROPERTY(QColor raised READ raised NOTIFY themeChanged)
    Q_PROPERTY(QColor raisedHighlight READ raisedHighlight NOTIFY themeChanged)

    Q_PROPERTY(QColor shadow READ shadow NOTIFY themeChanged)

public:
    enum Theme {
        Light,
        Dark
    };
    Q_ENUM(Theme)

    explicit ColorPalette(QObject *parent = nullptr);

    Theme theme() const;
    Q_INVOKABLE void setTheme(const Theme &p_theme);

    QColor accent() const;
    QColor accentLight() const;
    QColor accentDark() const;
    QColor accentHighlight() const;
    QColor accentBorder() const;

    QColor content() const;
    QColor contentSecondary() const;
    QColor contentAccented() const;

    QColor window() const;
    QColor windowHighlight() const;

    QColor sunken() const;
    QColor sunkenBorder() const;

    QColor sunkenDark() const;
    QColor sunkenDarkBorder() const;

    QColor raised() const;
    QColor raisedHighlight() const;

    QColor shadow() const;

signals:
    void themeChanged();

private:
    void updateTheme();
    void changeToDarkTheme();
    void changeToLightTheme();

    Theme m_theme;

    QColor m_accent;
    QColor m_accentLight;
    QColor m_accentDark;
    QColor m_accentHighlight;
    QColor m_accentBorder;

    QColor m_content;
    QColor m_contentSecondary;
    QColor m_contentAccented;

    QColor m_window;
    QColor m_windowHighlight;

    QColor m_sunken;
    QColor m_sunkenBorder;

    QColor m_sunkenDark;
    QColor m_sunkenDarkBorder;

    QColor m_raised;
    QColor m_raisedHighlight;

    QColor m_shadow;
};

#endif // COLORPALETTE_H
