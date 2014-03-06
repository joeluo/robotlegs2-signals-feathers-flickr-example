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

import util.MockLogger;

public class TestFlickImageService
{



    private var service:FlickrImageService;
    private var serviceDispatcher:EventDispatcher;

    [Before]
    public function setUp():void
    {
        serviceDispatcher = new EventDispatcher();

//        for some weird reason the FlickImageService has to be cast at all times

        service = new FlickrImageService();

        (service as FlickrImageService).eventDispatcher = this.serviceDispatcher;
        (service as FlickrImageService).requestGalleryUpdateSignal = new RequestGalleryUpdateSignal();
        (service as FlickrImageService).logger = new MockLogger();

    }


    [Test(async)]
    public function test_retrieve_images_should_get_a_non_empty_gallery():void
    {
        handleSignal(this, (this.service as FlickrImageService).requestGalleryUpdateSignal, handleImagesReceived, 3000);
        (this.service as FlickrImageService).loadData();
//        service.loadData();
    }

    private function handleImagesReceived(event:SignalAsyncEvent, data:Object):void
    {
        assertThat(event.args[0].length, greaterThan(0));
    }

}

}
