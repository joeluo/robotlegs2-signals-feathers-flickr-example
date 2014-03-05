/**
 * Created by zan on 05/03/2014.
 */
package service
{
import flash.events.EventDispatcher;

import org.hamcrest.assertThat;
import org.hamcrest.number.greaterThan;

import org.osflash.signals.utils.SignalAsyncEvent;

import org.osflash.signals.utils.handleSignal;

import robotlegs.bender.bundles.mvcs.MVCSBundle;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;


import signals.requests.RequestGalleryUpdateSignal;

public class TestFlickImageService
{
    private var service:FlickrImageService;
    private var serviceDispatcher:EventDispatcher;
    private var context:IContext;

    [Before]
    public function setUp():void
    {

        context = new Context().install(MVCSBundle);
        serviceDispatcher = new EventDispatcher();
        service = new FlickrImageService();
        (service as FlickrImageService).eventDispatcher = this.serviceDispatcher;
//        service.eventDispatcher = this.serviceDispatcher;
        (service as FlickrImageService).requestGalleryUpdateSignal = new RequestGalleryUpdateSignal();
        (service as FlickrImageService).logger = context.getLogger(this);

    }

    [Test(async)]
    public function test_retrieve_images_should_get_a_non_empty_gallery():void
    {
        handleSignal(this, (this.service as FlickrImageService).requestGalleryUpdateSignal, handleImagesReceived, 3000);
        (this.service as FlickrImageService).loadData();
    }

    private function handleImagesReceived(event:SignalAsyncEvent, data:Object):void
    {
        assertThat(event.args[0].length, greaterThan(0));
    }

    private function handleServiceTimeout():void
    {

    }
}
}
