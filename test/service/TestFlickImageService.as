/**
 * Created by zan on 05/03/2014.
 */
package service
{
import service.*;

import flash.events.EventDispatcher;

import model.GalleryModel;

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
    private var _flickrImageService:FlickrImageService;
    private var _serviceDispatcher:EventDispatcher;

    [Before]
    public function setUp():void
    {

        _serviceDispatcher = new EventDispatcher();

        _flickrImageService = new FlickrImageService();
        _flickrImageService.eventDispatcher = this._serviceDispatcher;
        _flickrImageService.requestGalleryUpdateSignal = new RequestGalleryUpdateSignal();

        _flickrImageService.logger = new MockLogger();

    }

    [After]
    public function tearDown():void
    {
        _serviceDispatcher = null;
        _flickrImageService = null;
    }


    [Test(async)]
    public function test_retrieve_images_should_get_a_non_empty_gallery():void
    {
        handleSignal(this, _flickrImageService.requestGalleryUpdateSignal, handleImagesReceived, 3000);
        _flickrImageService.loadData();
    }

    private function handleImagesReceived(event:SignalAsyncEvent, data:Object):void
    {
        assertThat(event.args[0].length, greaterThan(0));
    }

}

}
