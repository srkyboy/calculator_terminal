// QTelnetServer, MIT License
// https://github.com/j2doll/QTelnetServer

#include <cstdio>
#include <iostream>
#include <algorithm>
#include <vector>
#include <sstream>

#include "qtelnetserver.h"
#include "telnettcpserver.h"
#include "telnettcpclient.h"

//----------------------------------------------------------------------------
//
TelnetTCPClient::TelnetTCPClient(int SocketDescriptor, TelnetTCPServer* parent )
    : QObject(parent){
    strCR = "\n";
    strShell = QString(">\n");

    CommandBuffer.clear();
    SessionID = SocketDescriptor;

    Socket = new QTcpSocket(this);
    if(!Socket->setSocketDescriptor(SessionID))
    {
        std::cerr << QTime::currentTime().toString().toStdString()
                  << " "
                  << SessionID << " Error binding socket\n";
        return;
    }

    //connect the signals
    connect( Socket, SIGNAL(readyRead()), this, SLOT(SocketReadyRead()), Qt::DirectConnection);
    connect( Socket, SIGNAL(disconnected()), this, SLOT(SocketDisconnected()), Qt::DirectConnection);

    std::cout << QTime::currentTime().toString().toStdString() << " "
              << SessionID << " Session Connected.\n";

}

QString TelnetTCPClient::trimBackSpace(QString strIn)
{

    QChar chBackSpace = QChar(QLatin1Char('\010')); // backspace

    int indexBackSpace = strIn.indexOf( chBackSpace );
    if ( indexBackSpace == (-1) )
    {
        return strIn; // backspace is not found
    }

    // remove backspace and pre-backspace character
    strIn.remove( indexBackSpace, 1 );
    if ( (indexBackSpace - 1) >= 0 )
    {
         strIn.remove( (indexBackSpace - 1), 1 );
    }

    return trimBackSpace(strIn);

}

QString TelnetTCPClient::ProcessCommand(QString command)
{
    if ( command.isEmpty() )
    {
        return "Please try something else...";
    }

    QString strRemoveBackSpace = this->trimBackSpace( command.trimmed() ); // remove backspace and pre-backspace character

    // parse command
    std::istringstream iss( strRemoveBackSpace.toStdString() );
    std::vector<std::string> parseResults((std::istream_iterator<std::string>(iss)),
                                     std::istream_iterator<std::string>());
    QStringList slArg;
    foreach (std::string ssArg, parseResults) {
        QString strArg = QString::fromStdString( ssArg );
        slArg.push_back( strArg );
    }

    //Proccess command
    if ( slArg.at(0).compare(QString("pritisni_dugme")) == 0 )
    {
        emit push_button(slArg.at(1));
        //return "Pritisnuo sam dugme";
    }

    if ( slArg.at(0) == QString("tekst_prozora") )
    {
        emit get_display();
        //return "Tekst Prozora: 120245";
    }

    return QString("Please try something else...");
}

//----------------------------------------------------------------------------
//
void TelnetTCPClient::SocketReadyRead()
{
    //Keep adding to the command buffer

    QByteArray Data = Socket->readAll();
    CommandBuffer.append(Data);

    std::cout << "Received: " << Data.toStdString() << std::endl;

    if ( ! CommandBuffer.endsWith('\n') )
    {
        return;
    }

    //Process the command
    std::cout << "Processing command..." << std::endl;
    DispatchCommand( CommandBuffer );
    CommandBuffer.clear();

    //std::cout << strShell.toStdString() << std::endl;

    //SendResponse( strShell );
}

//----------------------------------------------------------------------------
//
void TelnetTCPClient::SocketDisconnected()
{
    std::cout << QTime::currentTime().toString().toStdString() << " "
              << SessionID << " session disconnected.\n";

    //Cleanup
    Socket->deleteLater();
    this->deleteLater();
}

//----------------------------------------------------------------------------
//
void TelnetTCPClient::SendResponse(const char* data)
{
    SendResponse(QString::fromLatin1(data));
}

//----------------------------------------------------------------------------
//
void TelnetTCPClient::SendResponse(QString data)
{
    SendResponse(data.toLatin1());
}

//----------------------------------------------------------------------------
//
void TelnetTCPClient::SendResponse(QByteArray data)
{
    if ( Socket == 0 )
    {
        return;
    }

    if ( ! Socket->isValid() )
    {
        return;
    }

    if ( ! Socket->isOpen() )
    {
        return;
    }

    //Send the data to the client
    Socket->write(data);
    Socket->flush();
}

//----------------------------------------------------------------------------
//
void TelnetTCPClient::CloseSocket()
{
    Socket->close();
}

void TelnetTCPClient::return_display(QString disp)
{
    this->SendResponse(disp);
}

//----------------------------------------------------------------------------
//
void TelnetTCPClient::DispatchCommand(QString command)
{
    QString cmd = command.trimmed();

    if (isExit(cmd))
    {
        SendResponse( "bye..." );
        Socket->close();
        return;
    }

    QString ret = this->ProcessCommand( cmd );



//    if ( ! ret.isEmpty() )
//    {
//        SendResponse( ret + strCR );
//    }
}

//----------------------------------------------------------------------------
//
bool TelnetTCPClient::isExit(QString cmd)
{
    cmd = cmd.toLower(); // make lower

    if ( cmd == QString("exit") ||
        cmd == QString(".exit") ||
        cmd == QString("exit()") ||
        cmd == QString("exit;") ||
        cmd == QString("quit") ||
        cmd == QString(".quit") ||
        cmd == QString("quit()") ||
        cmd == QString("quit;") )
    {
        return true; // it is exit string
    }

    return false;
}




