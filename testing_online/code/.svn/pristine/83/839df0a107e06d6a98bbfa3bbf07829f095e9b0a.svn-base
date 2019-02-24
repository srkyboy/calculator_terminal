// QTelnetServer, MIT License
// https://github.com/j2doll/QTelnetServer

#ifndef QTELNETSERVER_H
#define QTELNETSERVER_H

#include <QtGlobal>
#include <QObject>
#include <QString>
#include <QPointer>
#include <QSettings>
#include <QByteArray>
#include <QStringList>
#include <QCryptographicHash>
#include <QSettings>
#include <QDateTime>
#include <QDate>
#include <QTime>

#define ORG_NAME        "Jay Two"
#define APP_NAME        "QTelnetSample"
#define PASSWORD_KEY    "password"

class TelnetTCPServer;

class QTelnetServer : public QObject
{
    Q_OBJECT
public:

    // constructor
    explicit QTelnetServer(QObject* parent = 0);

    // destructor
    ~QTelnetServer();

    // start telnet server
    int Start(quint16 telnetport = 23);

    // stop telnet server
    int Stop();

public:

    // telnet tcp server
    TelnetTCPServer *Server;

};

#endif // QTELNETSERVER_H
