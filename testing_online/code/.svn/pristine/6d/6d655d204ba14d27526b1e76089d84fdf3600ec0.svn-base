// QTelnetServer, MIT License
// https://github.com/j2doll/QTelnetServer

#include "qtelnetserver.h"
#include "telnettcpserver.h"

//-----------------------------------------------------------------------------
//
QTelnetServer::QTelnetServer(QObject* parent)
 : QObject(parent)
{
    Server = new TelnetTCPServer(this);
}

//-----------------------------------------------------------------------------
//
QTelnetServer::~QTelnetServer()
{
    delete Server;
}

//-----------------------------------------------------------------------------
//
int QTelnetServer::Start(quint16 telnetport)
{
    int ret = Server->StartServer( telnetport );
    return ret;
}

//-----------------------------------------------------------------------------
//
int QTelnetServer::Stop()
{
    Server->StopServer();
    return 0;
}
