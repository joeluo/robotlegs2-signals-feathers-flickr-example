package signals.requests
{

	import model.vo.GalleryItemVO;

import org.osflash.signals.ISignal;

import org.osflash.signals.Signal;

	public class RequestGalleryUpdateSignal extends Signal implements ISignal
	{
		public function RequestGalleryUpdateSignal() {

			super( Vector.<GalleryItemVO> );

		}
	}
}
