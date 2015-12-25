#include "mockupinputcontext.h"
#include <QDebug>
#include <QEvent>
#include <QGuiApplication>
#include "pinyininputmethod.h"

MockupInputContextPrivate::MockupInputContextPrivate() : view(0)
{
}

MockupInputContextPrivate::~MockupInputContextPrivate()
{
    if (view) {
        delete view;
    }
}

CPinyinInputMethod *pinyinInput = NULL;
MockupInputContextPrivate *MockupInputContext::d = new MockupInputContextPrivate();
MockupInputContext::MockupInputContext() :
    QPlatformInputContext()
{
    pinyinInput = new CPinyinInputMethod();
}

MockupInputContext::~MockupInputContext()
{

}

bool MockupInputContext::isValid() const
{
    return true;
}

QRectF MockupInputContext::keyboardRect() const
{
    return (d->view)? d->view->geometry(): QRectF();
}

void MockupInputContext::showInputPanel()
{
    if (!d->view)
    {
        d->view = new QQuickView();
        d->view->engine()->rootContext()->setContextProperty("keyEventDispatcher",&d->keyEventDispatcher);
        d->view->setSource(QUrl("qrc:/qml/InputPanel.qml"));

        d->view->setResizeMode(QQuickView::SizeViewToRootObject);
        d->view->setClearBeforeRendering(true);

        d->view->setColor(Qt::transparent);
        QSurfaceFormat f(d->view->format());
        f.setAlphaBufferSize(8);
        d->view->setFormat(f);

        d->view->engine()->rootContext()->setContextProperty("pinyinInput", pinyinInput);
        pinyinInput->Update();
        d->view->setFlags(d->view->flags() | Qt::Tool | Qt::FramelessWindowHint | Qt::WindowStaysOnTopHint	| Qt::WindowDoesNotAcceptFocus);
    }

    d->view->show();
    QPlatformInputContext::showInputPanel();
}

void MockupInputContext::hideInputPanel()
{
    if (d->view)
        d->view->hide();
}

bool MockupInputContext::isInputPanelVisible() const
{
    return (d->view) ? d->view->isVisible() : false;
}


void MockupInputContext::setFocusObject(QObject *object)
{
    d->keyEventDispatcher.setFocusItem(object);
}
