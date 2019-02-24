// QTelnetServer, MIT License
// https://github.com/j2doll/QTelnetServer

#ifndef TELNETTCPSERVER_H
#define TELNETTCPSERVER_H

#include <QtGlobal>
#include <QObject>
#include <QTcpServer>

class TelnetTCPServer : public QTcpServer
{
    Q_OBJECT

public:

    /*!
    * Constructor
    * @param parent The parent object
    */
    explicit TelnetTCPServer(QObject *parent = NULL);

    virtual ~TelnetTCPServer();

    /*!
    * Starts the TCP Server
    * @param port The port to start the server on
    */
    int StartServer(quint16 port);

    /*!
    * Stops the TCP Server
    */
    void StopServer();

    bool setPasswordHash(QString hashedpass);

signals:

    /*!
    * Signal indicates the TCP Server has stopped
    */
    void OnStarted();

    /*!
    * Signal indicates the TCP Server has stopped
    */
    void OnStopped();

    void signal_push_button(QString button);
    void ret_display(QString disp);
    void get_display();

public slots:
    void slot_push_button(QString button);
    void slot_get_display();
    void slot_ret_display(QString disp);

protected:

    /**
    * Processes incomming TCP connections
    * @param socketDescriptor The descriptor of the conection
    */
    void incomingConnection(qintptr socketDescriptor);




};

#endif // TELNETTCPSERVER_H
