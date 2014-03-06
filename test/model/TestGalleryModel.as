/**
 * Created by zan on 06/03/2014.
 */
package model
{
import model.vo.GalleryItemVO;

import org.flexunit.asserts.assertEquals;


import org.flexunit.asserts.assertNotNull;
import org.flexunit.asserts.assertNull;
import org.hamcrest.assertThat;
import org.hamcrest.object.instanceOf;
import org.osflash.signals.utils.SignalAsyncEvent;
import org.osflash.signals.utils.failOnSignal;
import org.osflash.signals.utils.handleSignal;

import signals.notifications.NotifyImageSelectedSignal;

import util.MockLogger;

public class TestGalleryModel
{
    private var _galleryModel:GalleryModel;

    [Before]
    public function setUp():void
    {

        _galleryModel = new GalleryModel();
        _galleryModel.logger = new MockLogger();
        _galleryModel.notifyImageSelectedSignal = new NotifyImageSelectedSignal();
    }

    [After]
    public function tearDown():void
    {
        _galleryModel = null;
    }

    [Test(async)]
    public function test_set_selectedItem_should_dispatch_a_NotifyImageSelectedSignal_with_the_selected_item():void
    {

        handleSignal(this, _galleryModel.notifyImageSelectedSignal, handleNotifyImageSelected, 500);

        var galleryItem:GalleryItemVO = new GalleryItemVO("title", "url", "thumbUrl");

        _galleryModel.selectedItem = galleryItem;

    }

    private function handleNotifyImageSelected(event:SignalAsyncEvent, data:Object):void
    {
        assertThat(event.args[0], instanceOf(GalleryItemVO));
    }

    [Test(async)]
    public function test_set_selectedItem_should_not_dispatch_a_NotifyImageSelectedSignal_when_the_same_item_is_already_selected():void
    {

        var galleryItem:GalleryItemVO = new GalleryItemVO("title", "url", "thumbUrl");

        _galleryModel.selectedItem = galleryItem;

        failOnSignal(this, _galleryModel.notifyImageSelectedSignal);

        _galleryModel.selectedItem = galleryItem;

    }

   [Test]
   public function test_get_selectedItem_should_return_null_when_no_item_is_selected():void
   {
       assertNull(_galleryModel.selectedItem);
   }

   [Test]
   public function test_get_selectedItem_should_return_the_currently_selected_item_when_we_have_first_set_it():void
   {
       var galleryItem:GalleryItemVO = new GalleryItemVO("title", "url", "thumbUrl");

       _galleryModel.selectedItem = galleryItem;

       assertEquals(galleryItem, _galleryModel.selectedItem);
   }

}
}
