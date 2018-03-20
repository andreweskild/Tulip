/*
 * This file is part of Tulip.
 *
 * Copyright (C) 2018 Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>
 * Copyright (C) 2018 Michael Spencer <sonrisesoftware@gmail.com>
 *
 * $BEGIN_LICENSE:MPL2$
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/.
 *
 * $END_LICENSE$
 */

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include <QFont>

#include "iconcategorymodel.h"
#include "iconnamemodel.h"

int main(int argc, char *argv[])
{
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QQuickStyle::setStyle(QLatin1String("../lib/qml/Tulip/Style"));

    QGuiApplication app(argc, argv);
    app.setQuitOnLastWindowClosed(true);

    QFont font(QLatin1String("IBM Plex Sans"), 8);
    app.setFont(font);

    // @uri Tulip.Demo
    qmlRegisterType<IconCategoryModel>("Tulip.Demo", 1, 0, "IconCategoryModel");
    qmlRegisterType<IconNameModel>("Tulip.Demo", 1, 0, "IconNameModel");

    QQmlApplicationEngine engine;

    engine.addImportPath(QLatin1String("../lib/qml/"));

    engine.load(QUrl(QLatin1String("qrc:/qml/main.qml")));

    return app.exec();
}
