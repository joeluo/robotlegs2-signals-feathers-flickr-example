/**
 * Created by zan on 06/03/2014.
 */
package view.thumbsview
{
import mockolate.prepare;
import mockolate.stub;

import model.vo.GalleryItemVO;

import org.flexunit.asserts.assertNotNull;

import org.flexunit.async.Async;
import org.hamcrest.assertThat;
import org.hamcrest.core.anything;
import org.hamcrest.core.isA;
import org.osflash.signals.ISignal;
import org.osflash.signals.Signal;
import org.osflash.signals.utils.SignalAsyncEvent;
import org.osflash.signals.utils.handleSignal;
import org.osflash.signals.utils.proceedOnSignal;

import signals.requests.RequestGalleryLoadSignal;
import signals.requests.RequestGalleryUpdateSignal;
import signals.requests.RequestImageSelectSignal;

import util.MockLogger;

[RunWith("mockolate.runner.MockolateRunner")]
public class TestThumbsViewMediator
{

    [Mock]
    public var mockThumbsView:ThumbsView;

    [Mock]
    public var mockImageSelectedSignal:Signal

    private var thumbsViewMediator:ThumbsViewMediator;

    [Before]
    public function setUp():void
    {

        thumbsViewMediator = new ThumbsViewMediator();
        thumbsViewMediator.logger = new MockLogger();
        thumbsViewMediator.requestGalleryLoadSignal = new RequestGalleryLoadSignal();
        thumbsViewMediator.notifyGalleryLoadedSignal = new RequestGalleryUpdateSignal();
        thumbsViewMediator.requestImageSelectSignal = new RequestImageSelectSignal();

        mockThumbsView.imageSelectedSignal = mockImageSelectedSignal;
        thumbsViewMediator.view = mockThumbsView;

    }



    [Test(async)]
    public function on_initialize_a_RequestGalleryLoadSignal_should_be_dispatched():void
    {

        proceedOnSignal(this, thumbsViewMediator.requestGalleryLoadSignal);
        thumbsViewMediator.initialize();

    }

    [Test(async)]
    public function onImageSelected_should_dispatch_a_RequestImageSelectSignal_with_the_item_to_request():void
    {

        var onImageSelectedSignal = new Signal(GalleryItemVO);

        mockThumbsView.imageSelectedSignal = onImageSelectedSignal;
        thumbsViewMediator.view = mockThumbsView;

        thumbsViewMediator.initialize();

        var galleryItemVO = new GalleryItemVO("title", "url", "thumburl");

        handleSignal(this, thumbsViewMediator.requestImageSelectSignal, handleRequestImageSelectSignal, 3000);

        thumbsViewMediator.view.imageSelectedSignal.dispatch(galleryItemVO)

    }

    private function handleRequestImageSelectSignal(event:SignalAsyncEvent, data:Object):void
    {
       assertThat(event.args[0], isA(GalleryItemVO));
    }
}
}
