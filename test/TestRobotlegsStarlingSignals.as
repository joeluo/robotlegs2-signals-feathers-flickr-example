/**
 * Created by zan on 05/03/2014.
 */
package
{
import flash.events.EventDispatcher;

import org.flexunit.assertThat;

import org.flexunit.asserts.assertEquals;
import org.hamcrest.number.greaterThan;
import org.osflash.signals.utils.SignalAsyncEvent;
import org.osflash.signals.utils.handleSignal;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;
import robotlegs.bender.framework.impl.Logger;

import service.FlickrImageService;
import service.IPhotoGalleryService;

import signals.requests.RequestGalleryUpdateSignal;

public class TestRobotlegsStarlingSignals
{
    private var service:FlickrImageService;
    private var serviceDispatcher:EventDispatcher;
    private var context:IContext;

    [Before]
    public function setUp():void
    {

        this.context = new Context().install(MVCSBundle);
        this.serviceDispatcher = new EventDispatcher();
        this.service = new FlickrImageService() as FlickrImageService;
//        service.eventDispatcher = this.serviceDispatcher;
//        service.requestGalleryUpdateSignal = new RequestGalleryUpdateSignal();
        (this.service as FlickrImageService).logger = context.getLogger(this);

    }

    [Test]
    public function test_that_fails():void
    {
       var thisIsFalse:Boolean = false;
       assertEquals("This test fails always!", true, thisIsFalse);
    }

    [Test]
    public function test_that_passes():void
    {
        var thisIsTrue:Boolean = true;
        assertEquals("This test always passes!", true, thisIsTrue);
    }





}
}
